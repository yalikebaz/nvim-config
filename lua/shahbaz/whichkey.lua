local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

require("shahbaz.browseConfig")

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	-- TODO: make a group for buffers: Bdelete!, bufferlinemovenext, bufferlinemoveprev...i dont think the last 2 work properly
	["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	-- ["P"] = { "<cmd>Telescope projects<cr>", "Projects" }, -- TODO: what is this?
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["v"] = { "<cmd>vsplit<cr>", "Vert split" },
	["w"] = { "<cmd>w!<CR>", "Save" },

	s = {
		name = "Search",
		a = { "<cmd>Alpha<cr>", "Alpha" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		-- c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		f = {
			"<cmd>Telescope find_files<cr>",
			"Find files",
		},
		F = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		m = { "<cmd>Telescope vim_bookmarks all theme=ivy<cr>", "All marks" },
		M = { "<cmd>Telescope vim_bookmarks current_file theme=ivy<cr>", "Marks in current file" },
		-- M = { "<cmd>Telescope man_pages<cr>", "Man Pages" }, --dunno wtf man pages are
		c = {
			"<cmd>lua require('telescope.builtin').colorscheme(require('telescope.themes').get_dropdown({enable_preview=true}))<cr>",
			"Colorscheme with Preview",

			-- require('telescope.themes').get_dropdown()
		},
		p = { ":e ~/.config/nvim/lua/shahbaz/plugins.lua<cr>", "Plugins" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		T = { "<cmd>:TodoTelescope<cr>", "Todos" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
	}, -- By the way, you can nest groups! Just follow the same syntax

	f = {
		name = "File",
		-- l = { "<cmd>:lopen<cr>", "Location list" },
		l = { "<cmd>:Telescope loclist<cr>", "Location list" },
		e = { ":call setloclist(0,[])<cr>:lua print('loclist emptied!')<cr>)", "Empty location list" },
		["/"] = { '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>', "Comment" },

		s = {
			function()
				local word1 = vim.fn.input("find: ", "")
				local word2 = vim.fn.input("replace with: ", "")
				local w = "s/" .. word1 .. "/" .. word2 .. "/" .. "g"
				vim.cmd(w)
			end,
			"Substitute in line",
		},

		c = {
			function()
				local word1 = vim.fn.input("find: ", "")
				local word2 = vim.fn.input("replace with: ", "")
				local w = "s/" .. word1 .. "/" .. word2 .. "/" .. "gc"
				vim.cmd(w)
			end,
			"Substitute in line (confirm)",
		},

		S = {
			function()
				local word1 = vim.fn.input("find: ", "")
				local word2 = vim.fn.input("replace with: ", "")
				local w = ":%s/" .. word1 .. "/" .. word2 .. "/" .. "g"
				vim.cmd(w)
			end,
			"Substitute in file",
		},

		C = {
			function()
				local word1 = vim.fn.input("find: ", "")
				local word2 = vim.fn.input("replace with: ", "")
				local w = ":%s/" .. word1 .. "/" .. word2 .. "/" .. "gc"
				vim.cmd(w)
			end,
			"Substitute in file (confirm)",
		},
	},

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {
			"<cmd>Telescope diagnostics<cr>",
			"Document Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},

	m = {
		name = "Marks",
		m = {
			"<cmd>:BookmarkToggle<cr>",
			"Toggle mark",
		},
		a = { "<cmd>:BookmarkAnnotate<CR>", "Mark annotation" },
	},

	o = {
		name = "Options",
		a = {
			"<cmd>set autochdir!<cr>:echo 'setting changed to: '|set autochdir?<cr>",
			"Toggle auto-change directory",
		},
		c = {
			"<cmd>set ignorecase!<cr>:echo 'setting changed to: '|set ignorecase?<cr>",
			"Toggle case sensitive search/replace",
		},
		r = { "<cmd>set relativenumber!<cr>", "Toggle relative line number" },
		n = { "<cmd>set number!<cr>", "Toggle line number" },
		w = { "<cmd>set wrap!<cr>", "Toggle word wrap" },
		z = { "<cmd>set fdm=indent<cr>", "Set foldmethod to syntax" },
	},

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	r = {
		name = "REST Client",
		o = {
			function()
				local f = io.open("RESTClient (delete me).rest", "r")
				if f == nil then
					vim.cmd(":e RESTClient (delete me).rest")
					vim.cmd("normal A# Don't save this file, just run the REST client commands.")
					vim.cmd("normal o# If you do save it, REMEMBER TO DELETE IT AFTER")
					vim.cmd("normal o") -- new line
					vim.cmd("normal ohttp://localhost: ")

					vim.cmd("normal o-i # needed for formatting")
					vim.cmd("normal o")
					vim.cmd("normal o# HEADERS, optional")
					vim.cmd("normal oContent-Type: application/json")
					vim.cmd("normal o# Authorization: Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==")
					vim.cmd("normal o# Cache-Control: no-cache")
					vim.cmd("normal o# Connection: keep-alive")
					vim.cmd("normal o# Cookie: userId=ac32:dfbe:8f1a:249c; sid=cfb48e3d98fcb1")
					vim.cmd("normal o# User-Agent: VRCnt-Type: application/json")

					vim.cmd("normal o")
					vim.cmd("normal o# ENDPOINTS")
					vim.cmd("normal o# GET /endpoint")
					vim.cmd("normal o# POST /endpoint")
					vim.cmd('normal o{"key": "new key","value": "new value"}')
					vim.cmd(":4")
					vim.cmd("startreplace")
				else
					vim.cmd(":e RESTClient (delete me).rest")
				end
			end,
			"Open REST client (VRC)",
		},
		c = { ":call VrcQuery()<cr><C-w>l:only<cr>", "Call endpoint" },
	},

	S = {
		name = "Session manager",
		s = {
			":SessionManager save_current_session<cr>",
			"Save current session",
		},
		l = {
			":SessionManager load_session<cr>",
			"Load session",
		},
		d = {
			":SessionManager delete_session<cr>",
			"Delete session",
		},
	},

	b = {
		name = "Buffers",
		p = {
			":BufferLinePick<cr>",
			"Pick buffer",
		},
		l = { "<cmd>:BufferLineMoveNext<cr>", "Move buffer right" },
		h = { "<cmd>:BufferLineMovePrev<cr>", "Move buffer left" },
		t = { "<cmd>:Telescope buffers<cr>", "Show all buffers" },

		g = {
			function()
				local num = vim.fn.input("Type buffer number: ", "")
				local cmd = "BufferLineGoToBuffer " .. num
				vim.cmd(cmd)
			end,
			"Go to buffer number",
		},
	},

	B = {
		name = "Browse",
		r = {
			function()
				require("browse").open_bookmarks({ bookmarks = Bookmarks })
			end,
			"References",
		},
		d = { "<cmd>lua require('browse.devdocs').search()<cr>", "Devdocs" },
		g = { "<cmd>lua require('browse').input_search()<cr>", "Google" },
	},

	t = {
		name = "Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		-- t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
		t = { "<cmd>ToggleTermToggleAll<cr>", "Toggle all terminals" },
	},

	u = {
		name = "UI",
		c = { "<cmd>VCoolor<cr>", "Color picker" },
		["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
		["M"] = { "<cmd>MarkdownPreview<cr>", "Markdown Preview" },
		["t"] = { ":luafile ~/.config/nvim/lua/shahbaz/toggle-colorscheme.lua<cr>", "Toggle light/dark mode" },
	},
}

local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
	["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
	-- ["s"] = { "Substitute" },
	-- '<,'>s/pee/poo/g
	v = {
		function()
			local word1 = vim.fn.input("find: ", "")
			local word2 = vim.fn.input("replace with: ", "")
			local w = ":'<,'>s/" .. word1 .. "/" .. word2 .. "/" .. "gc"
			vim.cmd(w)
		end,
		"Substitute in visual (confirm)",
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
