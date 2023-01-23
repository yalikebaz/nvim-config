-- This config was built follow chris@machine's neovim from scratch series
-- The .lua extensions are inferred by lua. In lsp's case, lua searches for init.lua

-- Core
require("shahbaz.plugins")
require("shahbaz.keymaps")
require("shahbaz.options")

-- Navigation
require("shahbaz.nvim-tree")
require("shahbaz.telescope")
-- require("shahbaz.bufferline") -- Don't use this anymore. Leaving it in here in case I change my mind.
require("shahbaz.alpha")
require("shahbaz.toggleterm") -- Don't use this as a terminal anymore in favor of tmux. Still useful for lazygit though.
require("shahbaz.whichkey")

-- Colorscheme
require("shahbaz.colorscheme")

-- CMP, LSP and Treesitter
require("shahbaz.treesitter")
require("shahbaz.lspzero")

-- Context related
require("shahbaz.todo-comments")
require("shahbaz.comment")
require("shahbaz.autopairs")
require("shahbaz.lualine")
-- require("shahbaz.indent-blankline") -- Trying to not use
require("shahbaz.gitsigns")
require("shahbaz.ufo")
require("shahbaz.browse")
