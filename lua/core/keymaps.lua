local opts = { noremap = true, silent = true }

-- Utility
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")
vim.keymap.set("n", "k", "(v:count > 1 ? 'm`' . v:count : '') . 'k'",
    { expr = true, desc = "Move up and add to jumplist if count > 1" })
vim.keymap.set("n", "j", "(v:count > 1 ? 'm`' . v:count : '') . 'j'",
    { expr = true, desc = "Move down and add to jumplist if count > 1" })
vim.keymap.set("n", "<leader>fl", "<cmd>:lopen<cr>", { desc = "Location list" })
vim.keymap.set("n", "<leader>fe", ":call setloclist(0,[])<cr>:lua print('loclist emptied!')<cr>",
    { desc = "Empty location list" })
vim.keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", { desc = "Telescope quickfix list" })
vim.keymap.set("n", "<leader>ut", function()
    ToggleColorScheme()
end)

-- Panes, windows, splits, tabs
vim.keymap.set("n", "<S-l>", ":tabnext<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<S-h>", ":tabprevious<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })            -- Resize window vertically, increase height
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })          -- Resize window vertically, decrease height
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", { desc = "Decrease window width" }) -- Resize window horizontally, decrease width
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", { desc = "Increase window width" })  -- Resize window horizontally, increase width
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { desc = "Vertical split" })                    -- Open a vertical split
vim.keymap.set("n", "<leader>|", ":vsplit<CR>", { desc = "Vertical split" })                    -- Shortcut for vertical split
vim.keymap.set("n", "<leader>-", ":split<CR>", { desc = "Horizontal split" })                   -- Open a horizontal split
vim.keymap.set("n", "<leader>st", function()
    local lr = vim.api.nvim_win_get_cursor(0)[1]
    vim.cmd("tabedit %")
    vim.cmd(":" .. lr)
end, { desc = "Open in new tab" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>smh", "<C-w>R", { desc = "Move tab left/upwards" })
vim.keymap.set("n", "<leader>sml", "<C-w>r", { desc = "Move tab right/downwards" })
vim.keymap.set("n", "<leader>smH", "<C-w>H", { desc = "Move tab to far left" })
vim.keymap.set("n", "<leader>smL", "<C-w>L", { desc = "Move tab to far right" })
vim.keymap.set("n", "<leader>smK", "<C-w>K", { desc = "Move tab to far top" })
vim.keymap.set("n", "<leader>smJ", "<C-w>J", { desc = "Move tab to far bottom" })
vim.keymap.set("n", "<leader>smx", "<C-w>x", { desc = "Exchange window (count needed first)" })
vim.keymap.set("n", "<leader>tt", "<cmd>tabnew<cr>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>th", "<cmd>-tabmove<cr>", { desc = "Move tab left" })
vim.keymap.set("n", "<leader>tl", "<cmd>+tabmove<cr>", { desc = "Move tab right" })

-- Substitute in line
-- require("which-key").register({ ["<leader>S"] = { name = "Substitute" } })
vim.keymap.set("n", "<leader>Ss", function()
    local word1 = vim.fn.input("find: ")
    local word2 = vim.fn.input("replace with: ")
    local w = "s/" .. word1 .. "/" .. word2 .. "/g"
    vim.cmd(w)
end, { desc = "Substitute in line" })

-- Substitute in line (confirm)
vim.keymap.set("n", "<leader>Sc", function()
    local word1 = vim.fn.input("find: ")
    local word2 = vim.fn.input("replace with: ")
    local w = "s/" .. word1 .. "/" .. word2 .. "/gc"
    vim.cmd(w)
end, { desc = "Substitute in line (confirm)" })

-- Substitute in file
vim.keymap.set("n", "<leader>SS", function()
    local word1 = vim.fn.input("find: ")
    local word2 = vim.fn.input("replace with: ")
    local w = ":%s/" .. word1 .. "/" .. word2 .. "/g"
    vim.cmd(w)
end, { desc = "Substitute in file" })

-- Substitute in file (confirm)
vim.keymap.set("n", "<leader>SC", function()
    local word1 = vim.fn.input("find: ")
    local word2 = vim.fn.input("replace with: ")
    local w = ":%s/" .. word1 .. "/" .. word2 .. "/gc"
    vim.cmd(w)
end, { desc = "Substitute in file (confirm)" })

-- Substitute visual mode
vim.keymap.set("v", "<leader>s", function()
    local word1 = vim.fn.input("find: ", "")
    local word2 = vim.fn.input("replace with: ", "")
    local w = ":'<,'>s/" .. word1 .. "/" .. word2 .. "/gc"
    vim.cmd(w)
end, { desc = "Substitute in visual (confirm)" })

vim.keymap.set("n", "<leader>ow", "<cmd>set wrap!<cr>", { desc = "Toggle line wrapping" })

vim.keymap.set("n", "gf", ":Flote<cr>", { desc = "Open floating window (Flote)" })

-- File formatting
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move selected text down" })
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move selected text up" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent selected text and stay in visual mode" })
vim.keymap.set("v", "<", "<gv", { desc = "Unindent selected text and stay in visual mode" })
vim.keymap.set("i", "ww", "<ESC>:w <CR>", { desc = "Save file in insert mode" })
vim.keymap.set("n", "<leader>w", ":w <cr>", { desc = "Save file" })

-- Copy/paste
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+yg_', { desc = "Yank line to system clipboard" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "Yank entire line to system clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste before cursor from system clipboard" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Paste from system clipboard in visual mode" })
vim.keymap.set("v", "<leader>P", '"+P', { desc = "Paste before in visual mode from system clipboard" })
vim.keymap.set("v", "p", '"_dP', { desc = "Paste over selection without overwriting clipboard" })

-- Navigation
vim.keymap.set("n", "go", ":Other<cr>", { desc = "Jump to related file (Other)" })
vim.keymap.set("n", "gO", ":OtherClear<cr>:Other<cr>", { desc = "Clear and jump to related file (Other)" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate to right window" })
vim.keymap.set("n", "<leader>q", ":q!<cr>", { desc = "Force quit" })
vim.keymap.set("n", "<leader>Q", ":qa! <CR>", { desc = "Force quit all windows" })
vim.keymap.set("n", "<Esc>", ":nohl<CR>|:echo<CR>", { desc = "Clear search highlighting" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
-- vim.keymap.set("n", "ga", ":AerialToggle<cr>")
-- vim.keymap.set("n", "ga", ":lua require('telescope').extensions.aerial.aerial(require('telescope.themes').get_ivy({}))<cr>")
-- vim.keymap.set("n", "ga", ":lua require('telescope').extensions.aerial.aerial(require('telescope.themes').get_ivy({layout_strategy='vertical', layout_config={vertical={anchor='E', width=0.2, height=0.9}}, previewer=false, sorting_strategy='descending', results_title=false, prompt_title=false, border=false}))<CR>")

vim.keymap.set("n", "gr", "<Plug>RestNvim")
-- vim.keymap.set("n", "]t", ":lua require('todo-comments').jump_next()<CR>")
-- vim.keymap.set("n", "]t", ":lua require('todo-comments').jump_prev()<CR>")

-- Terminal navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Navigate to left window in terminal" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Navigate to bottom window in terminal" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Navigate to top window in terminal" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Navigate to right window in terminal" })

-- Surround mappings
vim.keymap.set("n", "S'", "ysiw'", { desc = "Surround word with single quotes" })
vim.keymap.set("n", 'S"', 'ysiw"', { desc = "Surround word with double quotes" })
vim.keymap.set("n", "S)", "ysiw)", { desc = "Surround word with parentheses" })
vim.keymap.set("n", "S]", "ysiw]", { desc = "Surround word with square brackets" })
vim.keymap.set("n", "S}", "ysiw}", { desc = "Surround word with curly braces" })

-- Tab navigation

-- Insert --

-- Snippets --
-- Use <C-n> and <C-p> to jump back/forward respectively through snippets
-- vim.keymap.set(
--   "i",
--   "<C-n>",
--   -- "lua require('luasnip').luasnip#expand_or_jumpable() ? '' : '<Tab>'",
--   "<esc>:lua require('luasnip').jump(1)<CR>",
--   opts
-- )
-- vim.keymap.set(
--   "s",
--   "<C-n>",
--   -- "lua require('luasnip').luasnip#expand_or_jumpable() ? '' : '<Tab>'",
--   "<esc>:lua require('luasnip').jump(1)<CR>",
--   opts
-- )
--
-- vim.keymap.set("i", "<C-p>", "<esc>:lua require('luasnip').jump(-1)<CR>")
-- vim.keymap.set("s", "<C-p>", "<esc>:lua require('luasnip').jump(-1)<CR>")

-- Snippets
--[[ vim.keymap.set(
    "i",
    "<Tab>",
    -- "lua require('luasnip').luasnip#expand_or_jumpable() ? '' : '<Tab>'",
    "<esc>:lua require('luasnip').jump(1)<CR>",
    opts
)
vim.keymap.set(
    "s",
    "<Tab>",
    -- "lua require('luasnip').luasnip#expand_or_jumpable() ? '' : '<Tab>'",
    "<esc>:lua require('luasnip').jump(1)<CR>",
    opts
)
vim.keymap.set("i", "<S-Tab>", "<esc>:lua require('luasnip').jump(-1)<CR>")
vim.keymap.set("s", "<S-Tab>", "<esc>:lua require('luasnip').jump(-1)<CR>") ]]
