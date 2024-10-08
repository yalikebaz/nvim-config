return {
    'JellyApple102/flote.nvim',
    keys = {
        { "gf", ":Flote<cr>" },
    },
    cmd = { "Flote" }, -- Ensure it lazy loads when the command is invoked
    config = function()
        require('flote').setup {
            q_to_quit = true,
            window_style = 'minimal',
            window_border = 'single',
            window_title = false,
            notes_dir = vim.fn.stdpath('cache') .. '/flote',
            files = {
                global = 'flote-global.md',
                cwd = function()
                    return vim.fn.getcwd()
                end,
                file_name = function(cwd)
                    local base_name = vim.fs.basename(cwd)
                    local parent_base_name = vim.fs.basename(vim.fs.dirname(cwd))
                    return parent_base_name .. '_' .. base_name .. '.md'
                end
            }

        }

        -- Stops the lag when openeing caused by winbar trying to find the right path
        vim.api.nvim_create_autocmd("WinNew", {
            pattern = "*",
            callback = function()
                if vim.api.nvim_win_get_config(0).relative ~= "" then
                    -- Disable winbar for floating windows
                    vim.wo.winbar = nil
                end
            end
        })
    end
}
