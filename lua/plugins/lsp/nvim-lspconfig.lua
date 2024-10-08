-- Filter out .d.ts files from goto definition results
local function on_list(options)
    if #options.items > 1 then
        options.items = vim.tbl_filter(function(item)
            return not string.match(item.filename, '%.d%.ts$')
        end, options.items)
    end
    vim.fn.setqflist({}, ' ', {
        title = options.title,
        items = options.items,
        context = options.context
    })
    vim.cmd('cfirst') -- or 'copen' if you prefer
end
--
--
--
--  INFO: These functions get rid of node_module results in goto definition by filtering out .d.ts files
--[[ local function filter(arr, fn)
    if type(arr) ~= "table" then
        return arr
    end

    local filtered = {}
    for k, v in pairs(arr) do
        if fn(v, k, arr) then
            table.insert(filtered, v)
        end
    end

    return filtered
end

local function filterReactDTS(value)
    return not string.match(value.filename, '%.d%.ts$')
end

local function on_list(options)
    local items = options.items
    if #items > 1 then
        items = filter(items, filterReactDTS)
    end

    vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
    vim.api.nvim_command('cfirst') -- or maybe you want 'copen' instead of 'cfirst'
end ]]
--  end of filter functions

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
    },
    config = function()
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- import mason_lspconfig plugin
        local mason_lspconfig = require("mason-lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf, silent = true }

                -- Keybinds

                keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" }) -- show definition, references
                keymap.set("n", "<leader>lf", ":lua vim.lsp.buf.format({async = true})<cr>", opts)                   -- format file
                keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
                -- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" })
                keymap.set('n', 'gd', function() vim.lsp.buf.definition { on_list = on_list } end, opts) -- INFO: written like this to implement filter fn
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" })
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" })
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" })
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>",
                    { desc = "Show buffer diagnostics" })
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
                keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
                keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
                keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" })
                keymap.set("n", "<leader>lr", ":LspRestart<CR>", { desc = "Restart LSP" })
            end,
        })

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        mason_lspconfig.setup_handlers({
            -- default handler for installed servers
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ["svelte"] = function()
                -- configure svelte server
                lspconfig["svelte"].setup({
                    capabilities = capabilities,
                    on_attach = function(client, bufnr)
                        vim.api.nvim_create_autocmd("BufWritePost", {
                            pattern = { "*.js", "*.ts" },
                            callback = function(ctx)
                                -- Here use ctx.match instead of ctx.file
                                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                            end,
                        })
                    end,
                })
            end,
            ["graphql"] = function()
                -- configure graphql language server
                lspconfig["graphql"].setup({
                    capabilities = capabilities,
                    filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
                })
            end,
            ["emmet_ls"] = function()
                -- configure emmet language server
                lspconfig["emmet_ls"].setup({
                    capabilities = capabilities,
                    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
                })
            end,
            ["lua_ls"] = function()
                -- configure lua server (with special settings)
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            -- make the language server recognize "vim" global
                            diagnostics = {
                                globals = { "vim" },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                })
            end,
        })
    end,
}
