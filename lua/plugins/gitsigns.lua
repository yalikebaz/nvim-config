return {
    "lewis6991/gitsigns.nvim",
    events = { "BufEnter" },
    config = function()
        local status_ok, gitsigns = pcall(require, "gitsigns")
        if not status_ok then
            return
        end

        gitsigns.setup {
            signs                        = {
                add          = { text = '+' },
                change       = { text = '~' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~-' },
                untracked    = { text = '┆' },
            },
            signs_staged                 = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged_enable          = true,
            signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir                 = {
                follow_files = true
            },
            auto_attach                  = true,
            attach_to_untracked          = false,
            current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts      = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
            },
            current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
            sign_priority                = 6,
            update_debounce              = 100,
            status_formatter             = nil,   -- Use default
            max_file_length              = 40000, -- Disable if file is longer than this (in lines)
            preview_config               = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
        }

        -- keymaps
        vim.keymap.set("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", { desc = "Next git hunk" })
        vim.keymap.set("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", { desc = "Prev Hunk" })
        vim.keymap.set("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = "Blame" })
        vim.keymap.set("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", { desc = "Preview Hunk" })
        vim.keymap.set("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = "Reset Hunk" })
        vim.keymap.set("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", { desc = "Reset Buffer" })
        vim.keymap.set("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = "Stage Hunk" })
        vim.keymap.set("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            { desc = "Undo Stage Hunk" })
        vim.keymap.set("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Open changed file" })
        vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Checkout branch" })
        vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Checkout commit" })
        vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", { desc = "Diff" })
    end
}
