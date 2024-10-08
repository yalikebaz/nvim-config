-- For plugins that dont need much config
-- TODO: Check out supermaven.nvim for cursor-like IDE
return {
    { 'itchyny/vim-qfedit',    ft = 'qf' },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>U", ":UndotreeToggle<cr>:UndotreeFocus<cr>", desc = "Undo Tree", mode = "n" },
        }
    },
    "tpope/vim-surround",
    {
        "supermaven-inc/supermaven-nvim", -- INFO: The alternative is codeium.nvim, but it's not as good apparently
        opts = {}
    },
    --[[ use {
        "rest-nvim/rest.nvim", -- HTTP client, requires jq (brew install jq)
        requires = { "nvim-lua/plenary.nvim" },
        commit =
        "91badd46c60df6bd9800c809056af2d80d33da4c", -- INFO: Using this commit as the latest commit broke everything, see: https://github.com/rest-nvim/rest.nvim/issues/306. Apparently here's an alternative plugin: https://github.com/diepm/vim-rest-console
        opts = {
            result_split_in_place = true,
        },
    } ]]
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    "rafamadriz/friendly-snippets",
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },

    "p00f/nvim-ts-rainbow", -- Rainbow brackets
    { "KabbAmine/vCoolor.vim", cmd = "VCoolor" },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
}
