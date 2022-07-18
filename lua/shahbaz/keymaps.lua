local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

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

-- My bindings to add...
-- nnoremap <leader>b :buffers<CR>
-- nnoremap <leader>nh :nohl<CR>

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>q", "<Nop>", opts)
keymap("n", "<leader>q", ":q<cr>", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>q", ":q <CR>", { silent = true })

-- File formatting
keymap("n", "<leader>w", ":w <cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)

-- Navigate buffers, using l and h because K is reserved for goto in vim (unless I wanna remap that?)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
keymap("i", "jk", "<ESC>", opts) -- Press jk fast to enter
keymap("i", "kj", "<ESC>", opts)
keymap("i", "ww", "<ESC>:w <CR>", opts) -- Save

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

-- Telescope --
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts) --This is set in whichkey
-- keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Comments 
keymap("n", "<leader>/", '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>', opts) --why did i have to do it this way lol
-- the above doesnt uncomment jsx properly
keymap("v", "<leader>/", "gc<cr>", opts) -- TODO: this doesn't work
