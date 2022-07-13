-- Night
-- Colorscheme = "catppuccin"
-- Colorscheme = "nightfox"
Colorscheme = "codemonkey"

-- Day, type ':Catppuccin latte', or use dayfox
-- Colorscheme = "catppuccin"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. Colorscheme)
if not status_ok then
	vim.notify("Colorscheme " .. Colorscheme .. " not found!")
	return
end

-- To change the cursor color you have to go to iTerm2 > Profiles > Colors > Cursor Colors, it can be done in vim though with ":hi CursorLine guibg=#{some hex}"
-- vim.cmd("hi CursorLine guibg=gray30") -- Changing Line number color
--
-- Colorscheme specific configs
if Colorscheme == "catppuccin" then
	vim.cmd([[highlight IndentBlanklineIndent1 guibg=#270236 gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent2 guibg=#180124 gui=nocombine]])
	-- The next two commands are meant for Catppuccin macchiato
	vim.cmd("hi Comment guifg=#7F86A6")
	vim.cmd("hi LineNr guifg=#7F86A6")
elseif Colorscheme == "nightfox" then
	vim.cmd([[highlight IndentBlanklineIndent1 guibg=#222F45 gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent2 guibg=#131A24 gui=nocombine]])
elseif Colorscheme == "dayfox" then
	vim.cmd([[highlight IndentBlanklineIndent1 guibg=#DCE7CB gui=nocombine]])
	-- vim.cmd([[highlight IndentBlanklineIndent2 guibg= gui=nocombine]])
elseif Colorscheme == "codemonkey" then
	vim.cmd([[highlight IndentBlanklineIndent1 guibg=#222F45 gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent2 guibg=#131A24 gui=nocombine]])
else
	vim.cmd([[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]])
end

return Colorscheme
