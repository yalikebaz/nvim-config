-- :help options

-- vim.cmd("hi WinSeparator guifg=#C916AC")
vim.cmd("hi WinSeparator guifg=teal")

vim.opt.backup = false                          -- creates a backup file
-- vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse =
""                                              -- disallow the mouse to be used in neovim, see :h mouse for enabling options
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 1                         -- only show tabs if i have multiple open (which will never happen bc i dont use them)
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 50                         -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert 4 spaces for a tab
vim.opt.softtabstop = 4
vim.cmd("set foldmethod=expr")
--vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
vim.cmd("set foldlevelstart=20")

vim.opt.cursorline = true         -- highlight the current line
vim.opt.relativenumber = true     -- set relative numbered lines
vim.opt.number = true             -- set relative numbered lines
vim.opt.numberwidth = 4           -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"        -- always show the sign column, otherwise it would shift the text each time
vim.cmd [[set signcolumn=auto:2-5]]
vim.opt.wrap = false              -- display lines as one long line
vim.opt.scrolloff = 10            -- Max lines padding
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.cmdheight = 1             -- setting command height
vim.opt.shortmess:append "c"

-- Define autocommands for specific file types
vim.cmd [[
   augroup FileTypeSettings
        autocmd BufAdd,BufEnter,BufRead,BufNewFile *.ts,*.tsx,*.js,*.jsx setlocal tabstop=2 shiftwidth=2
        autocmd BufAdd,BufEnter,BufRead,BufNewFile *.go setlocal tabstop=4 shiftwidth=4
        autocmd BufAdd,BufEnter,BufRead,BufNewFile *.* cd ./
        autocmd BufAdd,BufEnter,BufRead,BufNewFile *.ts,*.tsx,*.js,*.jsx setlocal tabstop=2 shiftwidth=2
        autocmd BufAdd,BufEnter,BufRead,BufNewFile *.go setlocal tabstop=4 shiftwidth=4
        autocmd BufAdd,BufEnter,BufRead,BufNewFile *.* cd ./
        autocmd BufRead,BufNewFile .env* set ft=sh
        autocmd BufRead,BufNewFile *.http set ft=sh
   augroup END
]]

vim.cmd "set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,n-v-c-i:blinkon100"
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work. Not even sure what this is?

vim.cmd "set noautochdir"          -- Auto change directory, makes terminal cd into the directory accessed in nvim
