return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    cmd = 'Telescope',
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Fuzzy find files in cwd" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>",    desc = "Fuzzy find recent files" },
        { "<leader>fs", "<cmd>Telescope live_grep<cr>",   desc = "Find string in cwd" },
        { "<leader>fk", "<cmd>Telescope keymaps<cr>",     desc = "Telescope keymaps" },
        { "<leader>ft", "<cmd>TodoTelescope<cr>",         desc = "Find todos" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Help" },
        {
            "<leader>fc",
            "<cmd>lua require('telescope.builtin').colorscheme(require('telescope.themes').get_dropdown({enable_preview=true}))<cr>",
            desc = "Colorscheme",
        },
        { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local transform_mod = require("telescope.actions.mt").transform_mod
        require("telescope").load_extension("aerial")

        --   local trouble = require("trouble")
        --   local trouble_telescope = require("trouble.sources.telescope")

        -- or create your custom action
        --    local custom_actions = transform_mod({
        --      open_trouble_qflist = function(prompt_bufnr)
        --        trouble.toggle("quickfix")
        --      end,
        --    })

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                file_ignore_patterns = { ".[lock].json", "node_modules", ".expo", ".git" },
                initial_mode = "normal",
                layout_strategy = "vertical",
                mappings = {
                    i = {
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-c>"] = actions.close,
                        ["<esc>"] = actions.close,
                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,
                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-t>"] = actions.select_tab,
                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,
                        ["<PageUp>"] = actions.results_scrolling_up,
                        ["<PageDown>"] = actions.results_scrolling_down,
                        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        -- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["<C-s>"] = actions.send_selected_to_loclist + actions.open_loclist,
                        ["<C-l>"] = actions.send_to_loclist + actions.open_loclist,
                        -- ["<C-l>"] = actions.complete_tag,
                        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                    },
                    n = {
                        ["q"] = actions.close,
                        ["<C-c>"] = actions.close,
                        ["<esc>"] = actions.close,
                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["D"] = actions.delete_buffer,
                        ["<C-t>"] = actions.select_tab,
                        ["s"] = actions.toggle_selection + actions.move_selection_worse,
                        -- ["<S-s>"] = actions.toggle_selection + actions.move_selection_worse,
                        -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        ["<C-s>"] = actions.send_selected_to_loclist + actions.open_loclist,
                        ["<C-l>"] = actions.send_to_loclist + actions.open_loclist,
                        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["j"] = actions.move_selection_next,
                        ["k"] = actions.move_selection_previous,
                        ["H"] = actions.move_to_top,
                        ["M"] = actions.move_to_middle,
                        ["L"] = actions.move_to_bottom,
                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,
                        ["gg"] = actions.move_to_top,
                        ["G"] = actions.move_to_bottom,
                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,
                        ["<PageUp>"] = actions.results_scrolling_up,
                        ["<PageDown>"] = actions.results_scrolling_down,
                        ["?"] = actions.which_key,
                    },
                },
            },
            pickers = {
                -- INFO: what i did was make telescope start in normal (see above) by default (cause i couldnt find todo picker) and make it insert for the couple that i want. so some of the below config is redundant
                --
                -- Default configuration for builtin pickers goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
                buffers = {
                    initial_mode = "normal" -- Opens telescope in normal mode when running :Telescope buffers
                },
                find_files = {
                    hidden = true,
                    initial_mode = "insert"
                },
                live_grep = {
                    initial_mode = "insert"
                },
                oldfiles = {
                    initial_mode = "normal"
                },
                quickfix = {
                    initial_mode = "normal"
                },
                lsp_references = {
                    initial_mode = "normal"
                },
                help_tags = {
                    initial_mode = "insert"
                },
            },

            extensions = {
                -- Your extension configuration goes here:
                -- extension_name = {
                --   extension_config_key = value,
                -- }
                -- please take a look at the readme of the extension you want to configure
                aerial = {
                    -- How to format the symbols
                    format_symbol = function(symbol_path, filetype)
                        if filetype == "json" or filetype == "yaml" then
                            return table.concat(symbol_path, ".")
                        else
                            return symbol_path[#symbol_path]
                        end
                    end,
                    -- Available modes: symbols, lines, both
                    show_columns = "both",
                },
                media_files = {
                    filetypes = { "png", "webp", "jpg", "jpeg" },
                    find_cmd = "rg", -- find command (defaults to `fd`)
                },
            },
        })

        telescope.load_extension("fzf")
    end,
}
