-- nice default
local colorscheme = "catppuccin"
-- for day change the flavor to latte with :Catppuccin latte

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- To change the cursor color you have to go to iTerm2 > Profiles > Colors > Cursor Colors
vim.cmd("hi Comment guifg=#32a852")
vim.cmd("hi LineNr guifg=#32a852")
