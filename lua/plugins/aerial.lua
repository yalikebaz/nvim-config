return {
    "stevearc/aerial.nvim",
    lazy = true,
    cmd = { "AerialToggle", "AerialOpen" }, -- Lazy load when these commands are used
    keys = {
        { "ga", ":lua require('telescope').extensions.aerial.aerial(require('telescope.themes').get_dropdown({layout_strategy='vertical', layout_config={vertical={anchor='E', width=0.2, height=0.9}}, previewer=false, sorting_strategy='ascending', results_title=false, prompt_title=false, border=false}))<CR>" }
    },
    config = true,
    --[[ config = function()
        require('aerial').setup()
        vim.keymap.set("n", "ga",
            ":lua require('telescope').extensions.aerial.aerial(require('telescope.themes').get_dropdown({layout_strategy='vertical', layout_config={vertical={anchor='E', width=0.2, height=0.9}}, previewer=false, sorting_strategy='ascending', results_title=false, prompt_title=false, border=false}))<CR>")
    end ]]
}
