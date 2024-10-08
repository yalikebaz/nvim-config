function ToggleColorScheme()
    if vim.o.background == 'dark' then
        vim.o.background = 'light'
    else
        vim.o.background = 'dark'
    end
end

-- Colorschemes are now lazy loaded, so these won't appear in `Telescope colorscheme` until you actually set them
return {
    {
        "Mofiqul/vscode.nvim", -- Set the default colorscheme here
        name = "vscode",
        lazy = false,          -- Default one is not lazy loaded
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme vscode]])
        end
    },
    { "lunarvim/colorschemes",       lazy = false }, -- Not lazy loading this because it has a bunch of custom ones
    { "bluz71/vim-nightfly-colors",  lazy = true },  -- use name "nightfly"
    { "Mofiqul/dracula.nvim",        lazy = true },
    { "projekt0n/github-nvim-theme", lazy = true },
    { "ribru17/bamboo.nvim",         lazy = true },
    { "folke/tokyonight.nvim",       lazy = true },
    { "morhetz/gruvbox",             lazy = true },
    { "oxfist/night-owl.nvim",       lazy = true },
    { "EdenEast/nightfox.nvim",      lazy = true }
}


-- Change the ColorScheme variable to set the default theme on launch
-- INFO: To change the cursor color you have to go to kitty settings (cmd + ,)

-- DarkColorScheme = "bamboo"
-- LightColorScheme = "vscode"
--
-- ColorScheme = DarkColorScheme
--
-- local function setScheme(scheme)
--     local status_ok, _ = pcall(vim.cmd, "colorscheme " .. scheme)
--     if not status_ok then
--         vim.notify("ColorScheme " .. ColorScheme .. " not found!")
--         return
--     end
--     ColorScheme = scheme
-- end
--

--
-- setScheme(ColorScheme)
--
-- -- vim.cmd("hi CursorLine guibg=gray30") -- Changing Line number color
--
-- return ColorScheme
