local function nvim_tree_on_attach(bufnr)
    local api = require('nvim-tree.api')

    -- When you supply an `on_attach` function, nvim-tree won't
    -- automatically set up the default keymaps unless call we call
    -- the `default_on_attach` function. See `:help nvim-tree-quickstart-custom-mappings`.
    api.config.mappings.default_on_attach(bufnr)

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    local preview = require('nvim-tree-preview')

    vim.keymap.set('n', 'P', preview.watch, opts 'Preview (Watch)')
    vim.keymap.set('n', '<Esc>', preview.unwatch, opts 'Close Preview/Unwatch')

    -- Option A: Smart tab behavior: Only preview files, expand/collapse directories (recommended)
    vim.keymap.set('n', '<Tab>', function()
        local ok, node = pcall(api.tree.get_node_under_cursor)
        if ok and node then
            if node.type == 'directory' then
                api.node.open.edit()
            else
                preview.node(node, { toggle_focus = true })
            end
        end
    end, opts 'Preview')

    vim.keymap.set("n", "w", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "?", api.tree.toggle_help, opts("Toggle Help"))
    vim.keymap.set("n", ".", api.tree.change_root_to_node, opts("CD"))
end

return {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeOpen" }, -- Lazy load when these commands are used
    lazy = true,
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
        "b0o/nvim-tree-preview.lua",
        lazy = true
    },
    config = function()
        local api = require("nvim-tree.api")

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer

        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            prefer_startup_root = true,
            on_attach = nvim_tree_on_attach,
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = true,
                debounce_delay = 50,
                severity = {
                    min = vim.diagnostic.severity.HINT,
                    max = vim.diagnostic.severity.ERROR,
                },
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            update_focused_file = {
                enable = true,
                update_root = true,
            },
            view = {
                adaptive_size = true,
                preserve_window_proportions = true,
            },
            renderer = {
                group_empty = false,
                highlight_opened_files = "all", -- "none", "icon", "name", or "all"
            },
            git = {
                ignore = false,
            },
        })
    end
}
