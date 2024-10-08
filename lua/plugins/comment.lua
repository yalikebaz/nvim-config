return {
    'numToStr/Comment.nvim',
    config = true,                                                    -- equivalent to calling setup()
    keys = {
        { "gcc", mode = "n", desc = "Comment toggle linewise" },      -- Lazy load on `gcc` for normal mode
        { "gc",  mode = "v", desc = "Comment toggle linewise" },      -- Lazy load on `gc` for visual mode
        { "gbc", mode = "n", desc = "Comment toggle blockwise" },     -- Lazy load on `gbc` for block comments
        { "gb",  mode = "v", desc = "Comment toggle blockwise" },     -- Lazy load on `gb` for block comments
    },
}
