local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    -- compile_path = util.join_paths(vim.fn.stdpath("config"), "plugin", "packer_compiled.lua"),
    -- compile_path = "~/.config/nvim/lua/shahbaz/packer_compiled.lua",
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- ****************** ################## ******************  PLUGINS START ******************  ##################   ******************

-- Plugins are located at .local/share/nvim/site/pack/packer/start These are plugins that run on startup
-- My plugins here, format is: `use("user/repo")`
-- TODO: Is there some way to organize this file better?
return packer.startup(function(use)
    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("kdheepak/lazygit.nvim")  -- Nice plugin to use lazygit
    use { "rest-nvim/rest.nvim", requires = { "nvim-lua/plenary.nvim" } } -- HTTP client, requires jq (brew install jq)

    -- Debugger --
    use 'ray-x/go.nvim'
    -- use 'leoluz/nvim-dap-go' NOTE: Got rid of this plugin, couldn't figure out how to make it load local environment variables. Using the above instead
    use { "mfussenegger/nvim-dap" }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use 'theHamsta/nvim-dap-virtual-text'
    use { 'folke/neodev.nvim',
        config = function()
            require('neodev').setup(
                { library = { plugins = { "nvim-dap-ui" }, types = true } }
            )
        end
    }

    -- Navigation --
    use 'itchyny/vim-qfedit' -- Allows you to edit the loclist/qf list
    use 'chentoast/marks.nvim' -- Better marks in nvim
    use 'rgroli/other.nvim'
    use 'mbbill/undotree'
    use {
        'stevearc/aerial.nvim',
        config = function() require('aerial').setup() end
    }
    use {
        'nvim-tree/nvim-tree.lua',         -- File tree
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }

    use({
        "nvim-lualine/lualine.nvim", -- A statusline that isn't horrible
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })
    use("goolord/alpha-nvim")
    use("ThePrimeagen/harpoon")           -- Easily navigate files
    use("christoomey/vim-tmux-navigator") -- tmux and split window navigation
    use("moll/vim-bbye")                  -- Provides :Bdelete, which is less annoying than :bdelete
    use("folke/which-key.nvim")           -- Showing bindings
    use({
        "lalitmee/browse.nvim",           -- A handy search tool
        requires = { "nvim-telescope/telescope.nvim" },
    })
    use("BurntSushi/ripgrep") --ripgrep needed for live-grep in telescope

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use("nvim-telescope/telescope-media-files.nvim") -- able to view media files in the telescope preview

    -- File formatting --
    use("jose-elias-alvarez/null-ls.nvim")     -- null-ls for formatting where LSP servers cannot themselves. See https://www.reddit.com/r/neovim/comments/y26hw2/lspzero_lspzeroformat_lsp_format_request_failed/
    use("tpope/vim-surround")                  -- Vim surround
    use("lukas-reineke/indent-blankline.nvim") -- Shows indent lines

    -- Snippets
    use "rafamadriz/friendly-snippets"
    use {
        'L3MON4D3/LuaSnip', -- snippet engine
        config = function()
            require("luasnip/loaders/from_vscode").load({
                paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" } })
        end
    }
    use("saadparwaiz1/cmp_luasnip") -- snippet oompletionslua

    use({
        "iamcco/markdown-preview.nvim", -- Markdown preview
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })
    use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }) -- Better vim folding
    use({
        "numToStr/Comment.nvim",                                              -- Easily comment stuff
        config = function()
            require("Comment").setup()
        end,
    })
    use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }) -- a better TODO manager
    use("KabbAmine/vCoolor.vim")                                            -- color picker

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })

    -- Treesitter plugins
    use "nvim-treesitter/nvim-treesitter-context"
    use("windwp/nvim-autopairs")                       -- Autopair brackets, integrates with both cmp and treesitter
    use("p00f/nvim-ts-rainbow")                        -- Rainbow brackets
    use("JoosepAlviste/nvim-ts-context-commentstring") -- Contextual comments for tsx
    -- use({
    --     -- Auto tagging for html
    --     "windwp/nvim-ts-autotag",
    --     config = function()
    --         require("nvim-treesitter.configs").setup({
    --             autotag = {
    --                 enable = true,
    --             },
    --         })
    --     end,
    -- })

    -- Color schemes --
    use 'Mofiqul/dracula.nvim'
    use { 'ribru17/bamboo.nvim' }
    use { 'nyoom-engineering/oxocarbon.nvim' }
    use("lunarvim/colorschemes") -- A bunch of colorschemes
    use("folke/tokyonight.nvim")
    use("ajgrf/parchment")
    use({
        "catppuccin/nvim",
        as = "catppuccin",
    })
    use("morhetz/gruvbox")
    use("arcticicestudio/nord-vim")
    use("EdenEast/nightfox.nvim")
    use("sainnhe/edge")

    -- Miscellaneous
    use("nvim-lua/popup.nvim")     -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim")   -- Useful lua functions used by lots of plugins
    use("lewis6991/gitsigns.nvim") -- Git signs

    -- use("hrsh7th/cmp-cmdline") -- cmdline completions. Not sure what this is or if I need it

    -- LSP
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },             -- Required
            { "williamboman/mason.nvim" },           -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },         -- Required
            { "hrsh7th/cmp-nvim-lsp" },     -- Required
            { "hrsh7th/cmp-buffer" },       -- Optional
            { "hrsh7th/cmp-path" },         -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" },     -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" }, -- Required
        },
    })

    -- ****************** ################## ******************  PLUGINS END ******************  ##################   ******************

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
