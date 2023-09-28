require("rest-nvim").setup({
    -- Open request results in a horizontal split
    result_split_horizontal = false,
    -- Keep the http file buffer above|left when split horizontal|vertical
    result_split_in_place = false,
    -- Skip SSL verification, useful for unknown certificates
    skip_ssl_verification = false,
    -- Encode URL before making request
    encode_url = true,
    -- Highlight request on run
    highlight = {
        enabled = true,
        timeout = 150,
    },
    result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        -- show the generated curl command in case you want to launch
        -- the same request via the terminal (can be verbose)
        show_curl_command = false,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to false if you want to disable them
        formatters = {
            json = "jq",
            html = function(body)
                return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end
        },
    },
    -- Jump to request line on run
    jump_to_request = false,
    env_file = '.env',
    custom_dynamic_variables = {},
    yank_dry_run = true,
})

-- graphql_format function, called in whichkey
local M = {}
M.format_graphql_prettier = function()
    -- Jump to the previous unmatched { character until the cursor is in column 0 and the character below is {
    while vim.fn.col('.') > 1 or vim.fn.getline('.'):sub(vim.fn.col('.'), vim.fn.col('.')) ~= '{' do
        vim.cmd("normal [{")
    end
    -- Now, the cursor should be at the start of the GraphQL query
    local line_start = vim.fn.line(".")

    -- Use Vim's % command to jump to the matching brace
    vim.cmd("normal %")
    local line_end = vim.fn.line(".")

    -- Get the content of the specified range
    local original_content = table.concat(vim.fn.getline(line_start, line_end), "\n")

    -- Display the original content for the user to review
    local decision = vim.fn.input("Selected content:\n" .. original_content .. "\nProceed? (y/n or Enter to proceed): ")

    -- If the user decides not to proceed, exit the function
    if decision ~= 'y' and decision ~= 'Y' and decision ~= '' then
        print("Operation cancelled by user.")
        return
    end

    -- Construct the command to send the range to prettier
    local cmd = string.format(":%d,%d!prettier --parser graphql", line_start, line_end)

    -- Execute the command
    vim.cmd(cmd)

    -- Get the newly formatted content
    local formatted_content = table.concat(vim.fn.getline(line_start, line_end), "\n")

    -- Show the formatted content to the user for confirmation
    local confirm_formatting = vim.fn.input("Formatted content:\n" ..
        formatted_content .. "\nAccept formatting? (y/n or Enter to accept): ")

    -- If the user decides not to accept the formatting, revert the changes
    if confirm_formatting ~= 'y' and confirm_formatting ~= 'Y' and confirm_formatting ~= '' then
        vim.fn.setline(line_start, vim.split(original_content, "\n"))
        print("Reverted formatting changes.")
    end
end
return M
