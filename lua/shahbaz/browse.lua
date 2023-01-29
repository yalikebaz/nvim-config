local browse = require('browse')

Bookmarks = {
	"https://ss64.com/osx/", -- Command line ref
	"https://devdocs.io/", -- Devdocs
	"https://css-tricks.com/snippets/css/a-guide-to-flexbox/", -- Flexbox
	"https://rogerdudler.github.io/git-guide/", -- Git
	"https://devhints.io/vim", -- Vim cheatsheet
	"https://css-tricks.com/snippets/css/complete-guide-grid/", -- CSS Grid
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
