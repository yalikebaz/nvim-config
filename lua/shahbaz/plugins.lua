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
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- ****************** ################## ******************  PLUGINS START ******************  ##################   ******************

-- Plugins are located at .local/share/nvim/site/pack/packer/start These are plugins that run on startup
-- My plugins here, format is: `use:("user/repo")`
return packer.startup(function(use)
	-- Miscellaneous
  use("Shatur/neovim-session-manager")
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }) -- Better vim folding
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use({
		"numToStr/Comment.nvim", -- Easily comment stuff
		config = function()
			require("Comment").setup()
		end,
	})
	use("akinsho/bufferline.nvim") -- Tracks buffers
	use("moll/vim-bbye") -- Provides :Bdelete, which is less annoying than :bdelete
	use("folke/which-key.nvim") -- Showing bindings
	use("lukas-reineke/indent-blankline.nvim") -- Shows indent lines.
	use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }) -- a better todo manager
	use("KabbAmine/vCoolor.vim") -- color picker
	use({
		"lalitmee/browse.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("browse").setup({
				provider = "google",
			})
		end,
	}) -- A handy browse tool
	use("diepm/vim-rest-console") -- A REST client

	-- color schemes
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

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- LSP
	use({
		"williamboman/nvim-lsp-installer", -- language server installer
		"neovim/nvim-lspconfig", --LSP config native to neovim
	})
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Treesitter plugins
	-- use("tree-sitter/tree-sitter-typescript")
	use("windwp/nvim-autopairs") -- Autopair brackets, integrates with both cmp and treesitter
	use("p00f/nvim-ts-rainbow") -- Rainbow brackets
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Contextual comments for tsx
	use({ -- Auto tagging for html
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
				},
			})
		end,
	})

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use, see here: https://github.com/rafamadriz/friendly-snippets/wiki#snippets-list
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-media-files.nvim") -- able to view media files in the telescope preview
	use("MattesGroeger/vim-bookmarks") -- better bookmarks
	use("tom-anders/telescope-vim-bookmarks.nvim") -- telescope extension for vim-bookmarks
	use("BurntSushi/ripgrep") --ripgrep needed for live-grep in telescope

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Terminal
	use("akinsho/toggleterm.nvim")

	-- Vim surround
	use("tpope/vim-surround")

	use("goolord/alpha-nvim")

	-- A statusline that isn't horrible
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- use({
	-- 	"iamcco/markdown-preview.nvim",
	-- 	run = "cd app && npm install",
	-- 	setup = function()
	-- 		vim.g.mkdp_filetypes = { "markdown" }
	-- 	end,
	-- 	ft = { "markdown" },
	-- })

	-- ****************** ################## ******************  PLUGINS END ******************  ##################   ******************

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
