require("shahbaz.alpha")
require("shahbaz.colorscheme")

if Colorscheme == "catppuccin" then
	SetScheme("codemonkey")
	Colorscheme = "codemonkey"
else
	SetScheme("catppuccin")
	Colorscheme = "catppuccin"
end

SetSpecifics()
-- FIX: the footer of alpha doesnt show the right colorscheme (it does but only after you come back to it)

local dashboard = require("alpha.themes.dashboard")
dashboard.section.footer.val = Footer()
