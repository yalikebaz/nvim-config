return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader> ", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",                                      desc = "Show harpoon marks" },
        { "<leader>1", ":lua require('harpoon.ui').nav_file(1)<cr>",                                                  desc = "Go to harpoon file 1" },
        { "<leader>2", ":lua require('harpoon.ui').nav_file(2)<cr>",                                                  desc = "Go to harpoon file 2" },
        { "<leader>3", ":lua require('harpoon.ui').nav_file(3)<cr>",                                                  desc = "Go to harpoon file 3" },
        { "<leader>4", ":lua require('harpoon.ui').nav_file(4)<cr>",                                                  desc = "Go to harpoon file 4" },
        { "<leader>5", ":lua require('harpoon.ui').nav_file(5)<cr>",                                                  desc = "Go to harpoon file 5" },
        { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>|<cmd>lua print('File added to harpoon')<cr>", desc = "Add file to harpoon" }
    },
}
