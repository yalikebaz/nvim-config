-- local highlight = {
--     "RainbowRed",
--     "RainbowYellow",
--     "RainbowBlue",
--     "RainbowOrange",
--     "RainbowGreen",
--     "RainbowViolet",
--     "RainbowCyan",
-- }
--
-- local hooks = require "ibl.hooks"
-- -- create the highlight groups in the highlight setup hook, so they are reset
-- -- every time the colorscheme changes
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--     vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#662121" })
--     vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#767621" })
--     vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#216631" })
--     vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#325a5e" })
--     vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#324b7b" })
--     vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
--     vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#562155" })
-- end)
--
-- require("ibl").setup { indent = { highlight = highlight } }

-- INFO:  new
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

-- vim.cmd [[highlight MyScopeHighlight guifg=#FC5CB9]]

require("ibl").setup {
    indent = {
        highlight = highlight,
        char = { "⎜" },
    },
    scope = {
        -- highlight = "MyScopeHighlight",
        priority = 2000,
        char = { "▎"}
        -- FIX: the show_start line is not 1 color... highlights are messed up
        -- show_start = false
    }
}
