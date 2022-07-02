-- This config was built follow chris@machine's neovim from scratch series
-- The .lua extensions are inferred by lua. In lsp's case, lua searches for init.lua

-- Core
require("shahbaz.plugins")
require("shahbaz.keymaps")
require("shahbaz.options")

-- Navigation
require("shahbaz.nvim-tree")
require("shahbaz.telescope")
require("shahbaz.bufferline")
require("shahbaz.alpha")
require("shahbaz.toggleterm")
require("shahbaz.whichkey")

-- Colorscheme
require("shahbaz.colorscheme")

-- CMP, LSP and Treesitter
require("shahbaz.cmp")
require("shahbaz.lsp")
require("shahbaz.treesitter")

-- Context related
require("shahbaz.todo-comments")
require("shahbaz.comment")
require("shahbaz.autopairs")
require("shahbaz.lualine")
require("shahbaz.indent-blankline")
require("shahbaz.gitsigns")
