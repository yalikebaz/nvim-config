return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local status_ok, lualine = pcall(require, "lualine")
        if not status_ok then
            return
        end

        local hide_in_width = function()
            return vim.fn.winwidth(0) > 80
        end

        local diagnostics = {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = { error = " ", warn = " " },
            colored = true,
            update_in_insert = false,
            always_visible = true,
        }

        local count = function()
            local total_lines = vim.fn.line("$")
            local current_line = vim.fn.line(".")
            return current_line .. "/" .. total_lines
        end

        local diff = {
            "diff",
            colored = true,
            symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
            cond = hide_in_width,
        }

        local mode = {
            "mode",
            fmt = function(str)
                return "-- " .. str .. " --"
                -- return " " .. str .. " "
            end,
        }

        local filetype = {
            "filetype",
            icons_enabled = false,
            icon = nil,
        }

        local branch = {
            "branch",
            icons_enabled = true,
            icon = "",
        }

        -- cool function for progress
        local progress = function()
            local current_line = vim.fn.line(".")
            local total_lines = vim.fn.line("$")
            local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
            local line_ratio = current_line / total_lines
            local index = math.ceil(line_ratio * #chars)
            return chars[index]
        end

        vim.cmd("hi WinBarNormal guifg='#9C6EE8'")
        vim.cmd("hi WinBarModified guifg='orange'")

        local isModified = function()
            if vim.bo.modified == true then
                vim.wo.winbar = '%=%#WinBarModified#%f%m'
                return "-- DOCUMENT MODIFIED --"
            else
                vim.wo.winbar = '%=%f%m'
            end
            return ""
        end

        lualine.setup({
            options = {
                icons_enabled = true,
                theme = "dracula", -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                -- disabled_filetypes = { "dashboard", "NvimTree", "Outline", "toggleterm" },
                disabled_filetypes = {
                    "dashboard",
                    "NvimTree",
                    "Outline",
                    "dap-repl",
                    "dapui_console",
                    "dapui_watches",
                    "dapui_stacks",
                    "dapui_breakpoints",
                    "dapui_scopes",
                },
                always_divide_middle = true,
                globalstatus = false,
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { branch, diagnostics },
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                    },
                    { isModified, color = { fg = '#0F141A', bg = 'orange' } }
                },
                -- lualine_c = {
                --   {
                --     "filename",
                --     path = 1,
                --   },
                -- },
                lualine_x = { diff, filetype },
                lualine_y = { count },
                lualine_z = { progress },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = {},
        })
    end
}
