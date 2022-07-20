local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

-- you can open another terminal by doing 2<C-\>, other another number for more
-- Btw the terminal should update its path based on the buffer you're in, if it doesn't start a new one (or quit and restart it). This is because of the set autochdir setting

toggleterm.setup({
	size = 15,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "horizontal", -- float | horizontal | vertical | tab 
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	-- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts), commenting this because it makes navigating through lazygit annoying, the esc key works fine I dont really need this keybind. But Im leavign it commented for reference
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	hidden = true,
	direction = "float",
	float_opts = {
		border = "double",
	},
	-- function to run on opening the terminal
	-- on_open = function(term)
	-- 	vim.cmd("startinsert!")
	-- 	vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	-- end,
})

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE() -- I can call this with :lua _NODE_TOGGLE(), or just press <leader>t n
	node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _NCDU_TOGGLE() -- something about file sizes, also not installed
	ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE() --this brings up some performance overlay, something i dont have installed
	htop:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })

function _PYTHON_TOGGLE() -- toggles the repl for python, i can delete this i guess
	python:toggle()
end
