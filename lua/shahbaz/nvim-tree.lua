-- -- setup with all defaults
-- -- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- -- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
--
-- require("nvim-tree").setup({ -- BEGIN_DEFAULT_OPTS
-- 	auto_reload_on_write = true,
-- 	disable_netrw = false,
-- 	hijack_cursor = false,
-- 	hijack_netrw = true,
-- 	hijack_unnamed_buffer_when_opening = false,
-- 	ignore_buffer_on_setup = false,
-- 	open_on_setup = false,
-- 	open_on_setup_file = false,
-- 	open_on_tab = false,
-- 	sort_by = "name",
-- 	update_cwd = true,
-- 	reload_on_bufenter = true,
-- 	view = {
-- 		width = 30,
-- 		height = 30,
-- 		hide_root_folder = false,
-- 		side = "left",
-- 		preserve_window_proportions = true,
-- 		number = true,
-- 		relativenumber = true,
-- 		signcolumn = "yes",
-- 		mappings = {
-- 			custom_only = false,
-- 			list = {
-- 				-- user mappings go here
-- 				{ key = { "<leader>cd" }, action = "cd" }, --instead of <C-]>
-- 			},
-- 		},
-- 	},
-- 	renderer = {
-- 		indent_markers = {
-- 			enable = false,
-- 			icons = {
-- 				corner = "└ ",
-- 				edge = "│ ",
-- 				none = "  ",
-- 			},
-- 		},
-- 		icons = {
-- 			webdev_colors = true,
-- 			git_placement = "before",
-- 		},
-- 	},
-- 	hijack_directories = {
-- 		enable = true,
-- 		auto_open = true,
-- 	},
-- 	update_focused_file = {
-- 		enable = true,
-- 		update_cwd = true,
-- 		ignore_list = {},
-- 	},
-- 	ignore_ft_on_setup = {},
-- 	system_open = {
-- 		cmd = "",
-- 		args = {},
-- 	},
-- 	diagnostics = {
-- 		enable = true,
-- 		show_on_dirs = true,
-- 		icons = {
-- 			hint = "",
-- 			info = "",
-- 			warning = "",
-- 			error = "",
-- 		},
-- 	},
-- 	filters = {
-- 		dotfiles = false,
-- 		custom = {},
-- 		exclude = {},
-- 	},
-- 	git = {
-- 		enable = true,
-- 		ignore = false,
-- 		timeout = 400,
-- 	},
-- 	actions = {
-- 		use_system_clipboard = true,
-- 		change_dir = {
-- 			enable = true,
-- 			global = false,
-- 			restrict_above_cwd = false,
-- 		},
-- 		open_file = {
-- 			quit_on_open = false,
-- 			resize_window = true,
-- 			window_picker = {
-- 				enable = true,
-- 				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
-- 				exclude = {
-- 					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
-- 					buftype = { "nofile", "terminal", "help" },
-- 				},
-- 			},
-- 		},
-- 	},
-- 	trash = {
-- 		cmd = "trash",
-- 		require_confirm = true,
-- 	},
-- 	live_filter = {
-- 		prefix = "[FILTER]: ",
-- 		always_show_folders = true,
-- 	},
-- 	log = {
-- 		enable = false,
-- 		truncate = false,
-- 		types = {
-- 			all = false,
-- 			config = false,
-- 			copy_paste = false,
-- 			diagnostics = false,
-- 			git = false,
-- 			profile = false,
-- 		},
-- 	},
-- }) -- END_DEFAULT_OPTS
--
--
--
-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set('n', 'w', api.node.open.edit, opts('Help'))
    vim.keymap.set('n', '.', api.tree.change_root_to_node, opts('CD'))
    vim.keymap.set('n', '<BS>', api.tree.change_root_to_parent, opts('Up'))
end

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    prefer_startup_root = true,
    -- sync_root_with_cwd = true,
    on_attach = my_on_attach,
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
        },
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_root = true
    },
    -- respect_buf_cwd = true,
    view = {
        adaptive_size = true,
        preserve_window_proportions = true,
    },
    renderer = {
        group_empty = false,
        highlight_opened_files = "all", -- "none", "icon", "name", or "all"
    },
    -- filters = {
    --     dotfiles = true,
    -- },
    git = {
        ignore = false
    },
})
