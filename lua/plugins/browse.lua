return {
    "lalitmee/browse.nvim",
    lazy = true,
    config = function()
        local browse = require('browse')

        Bookmarks = {
            ["Command line reference"] = "https://ss64.com/osx/",                      -- Command line ref
            ["Devdocs"] = "https://devdocs.io/",                                       -- Devdocs
            ["Flexbox"] = "https://css-tricks.com/snippets/css/a-guide-to-flexbox/",   -- Flexbox
            ["Git guide"] = "https://rogerdudler.github.io/git-guide/",                -- Git
            ["Vim cheatsheet"] = "https://devhints.io/vim",                            -- Vim cheatsheet
            ["CSS Grid"] = "https://css-tricks.com/snippets/css/complete-guide-grid/", -- CSS Grid
        }

        local function command(name, rhs, opts)
            opts = opts or {}
            vim.api.nvim_create_user_command(name, rhs, opts)
        end

        command("BrowseInputSearch", function()
            browse.input_search()
        end, {})

        command("Browse", function()
            browse.browse({ bookmarks = Bookmarks })
        end, {})

        command("BrowseBookmarks", function()
            browse.open_bookmarks({ bookmarks = Bookmarks })
        end, {})

        command("BrowseDevdocsSearch", function()
            browse.devdocs.search()
        end, {})

        command("BrowseDevdocsFiletypeSearch", function()
            browse.devdocs.search_with_filetype()
        end, {})

        command("BrowseMdnSearch", function()
            browse.mdn.search()
        end, {})

        return Bookmarks
    end,

    vim.keymap.set("n", "<leader>Bg", function()
        require("browse").input_search()
    end, { desc = "Google" }),

    vim.keymap.set("n", "<leader>Br", function()
        require("browse").open_bookmarks({ bookmarks = Bookmarks })
    end, { desc = "References" }),

    vim.keymap.set("n", "<leader>Bd", function()
        require("browse.devdocs").search()
    end, { desc = "Devdocs function" })
}
