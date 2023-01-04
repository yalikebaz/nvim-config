require("shahbaz.alpha")
require("shahbaz.colorscheme")

if Colorscheme == "nightfox" then
	SetScheme("catppuccin-latte")
	Colorscheme = "catppuccin-latte"
else
	SetScheme("nightfox")
	Colorscheme = "nightfox"
end

SetIndentColors()
-- FIX: i think after changing themes, the set specifics isnt working

local dashboard = require("alpha.themes.dashboard")
dashboard.section.footer.val = Footer()
