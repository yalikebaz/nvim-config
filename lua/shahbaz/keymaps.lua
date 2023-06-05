local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
-- nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

vim.keymap.set("n", "k", "(v:count > 1 ? 'm`' . v:count : '') . 'k'", { noremap = true, expr = true, silent = true })
vim.keymap.set("n", "j", "(v:count > 1 ? 'm`' . v:count : '') . 'j'", { noremap = true, expr = true, silent = true })

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>q", "<Nop>", opts)
keymap("n", "<leader>q", ":q<cr>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>q", ":q <CR>", { silent = true })
keymap("n", "<Esc>", ":nohl<CR>|:echo<CR>", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)

-- Surround
-- TODO: unmap the S key... idk how lol
keymap("n", "S'", "ysiw'", { silent = true })
keymap("n", 'S"', 'ysiw"', { silent = true })
keymap("n", "S(", "ysiw(", { silent = true })
keymap("n", "S[", "ysiw[", { silent = true })
keymap("n", "S{", "ysiw{", { silent = true })

-- File formatting
keymap("n", "<leader>w", ":w <cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)

-- Navigate tabs, using l and h because K is reserved for goto in vim (unless I wanna remap that?)
keymap("n", "<S-l>", ":tabnext<CR>", opts)
keymap("n", "<S-h>", ":tabprevious<CR>", opts)
-- keymap("n", "<cr>", "<ESC>ciw", opts) --

-- Insert --
keymap("i", "jk", "<ESC>", opts) -- Press jk fast to enter
keymap("i", "kj", "<ESC>", opts)
keymap("i", "ww", "<ESC>:w <CR>", opts) -- Save

-- Snippets --
-- Use <C-n> and <C-p> to jump back/forward respectively through snippets
keymap(
  "i",
  "<C-n>",
  -- "lua require('luasnip').luasnip#expand_or_jumpable() ? '' : '<Tab>'",
  "<esc>:lua require('luasnip').jump(1)<CR>",
  opts
)
keymap(
  "s",
  "<C-n>",
  -- "lua require('luasnip').luasnip#expand_or_jumpable() ? '' : '<Tab>'",
  "<esc>:lua require('luasnip').jump(1)<CR>",
  opts
)

keymap("i", "<C-p>", "<esc>:lua require('luasnip').jump(-1)<CR>", opts)
keymap("s", "<C-p>", "<esc>:lua require('luasnip').jump(-1)<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
keymap("v", "p", '"_dP', opts) -- When pasting over a highlighted item, keeps the original pasted item in clipboard

-- Visual Block (ctrl+v) --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
keymap("t", "<ESC>", "<C-\\><C-n>", term_opts)
