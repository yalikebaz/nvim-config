local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- null_ls.builtins.formatting.prettier, -- Uses default file list
        null_ls.builtins.formatting.prettier.with({
            filetypes = { "graphql" },
        }),
    },
})
