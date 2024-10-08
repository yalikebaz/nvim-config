return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header
        dashboard.section.header.val = {
            -- [[                                              __                           ]],
            -- [[                ___     ___    ___    __  __ /\_\    ___ ___               ]],
            -- [[               / _ `\  / __`\ / __`\ /\ \/\ \\/\ \  / __` __`\             ]],
            -- [[              /\ \/\ \/\  __//\ \_\ \\ \ \_/ |\ \ \/\ \/\ \/\ \            ]],
            -- [[              \ \_\ \_\ \____\ \____/ \ \___/  \ \_\ \_\ \_\ \_\           ]],
            -- [[               \/_/\/_/\/____/\/___/   \/__/    \/_/\/_/\/_/\/_/           ]],
            -- [[                                                                           ]],
            -- [[                                                                           ]],
            -- [[             ^^                   @@@@@@@@@                                ]],
            -- [[        ^^       ^^            @@@@@@@@@@@@@@@                             ]],
            -- [[                             @@@@@@@@@@@@@@@@@@              ^^            ]],
            -- [[                            @@@@@@@@@@@@@@@@@@@@                           ]],
            -- [[  ~~~~ ~~ ~~~~~ ~~~~~~~~ ~~ &&&&&&&&&&&&&&&&&&&& ~~~~~~~ ~~~~~~~~~~~ ~~~   ]],
            -- [[  ~         ~~   ~  ~       ~~~~~~~~~~~~~~~~~~~~ ~       ~~     ~~ ~       ]],
            -- [[    ~      ~~      ~~ ~~ ~~  ~~~~~~~~~~~~~ ~~~~  ~     ~~~    ~ ~~~  ~ ~~  ]],
            -- [[    ~  ~~     ~         ~      ~~~~~~  ~~ ~~~       ~~ ~ ~~  ~~ ~          ]],
            -- [[  ~  ~       ~ ~      ~           ~~ ~~~~~~  ~      ~~  ~             ~~   ]],
            -- [[        ~             ~        ~      ~      ~~   ~             ~          ]],

            [[   .-')          _                                             ]],
            [[  (`_^ (    .----`/                          __                ]],
            [[   ` )  \_/`   __/     __,    ___     __  __/\_\     ___ ___   ]],
            [[   __{   |`  __/      /_/    / _ `\ /\ \/\ \\/\ \  / __` __`\  ]],
            [[  / _{    \__/ '--.  //     /\ \/\ \\ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[  \_> \_\  >__/    \((      \ \_\ \_\\ \___/  \ \_\ \_\ \_\ \_\]],
            [[       _/ /` _\_   |))       \/_/\/_/ \/__/    \/_/\/_/\/_/\/_/]],
            [[      /__(  /______/`                                          ]],
            [[                                                               ]],
            [[                                                               ]],
        }

        -- Set menu
        dashboard.section.buttons.val = {
            -- For your own icons: https://www.nerdfonts.com/cheat-sheet
            dashboard.button("f", "󰱼  Find file", ":lua require('telescope.builtin').find_files({no_ignore=true})<cr>"),
            dashboard.button("e", "  Open Nvim Tree", "<cmd>NvimTreeToggle<cr>"),
            dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
            dashboard.button("s", "󱎸  Find string", ":Telescope live_grep <CR>"),
            dashboard.button("p", "  Plugin configuration", ":e ~/.config/nvim/lua/plugins/init.lua <CR>|:41<CR>"),
            dashboard.button(
                "c",
                "  Change colorscheme",
                "<cmd>lua require('telescope.builtin').colorscheme(require('telescope.themes').get_dropdown({enable_preview=true}))<cr>"
            ),
            dashboard.button(
                "t",
                "󰔎 Toggle light/dark mode",
                ":lua ToggleColorScheme()<CR>"
            ),
            dashboard.button("q", "󰿅  Quit Neovim", ":qa<CR>"),

        }
        dashboard.section.footer.val = vim.g.colors_name

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
}
