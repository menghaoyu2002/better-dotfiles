return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin]])
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<A-a>", "<cmd>NvimTreeFocus<CR>" },
            { "<A-d>", "<cmd>NvimTreeClose<CR>" },
        },
        opts = {
            filters = {
                dotfiles = false,
                git_ignored = false,
            },
        },
        event = "VimEnter",
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        config = true,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = true,
    },
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        opts = {
            theme = "hyper",
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
                    {
                        icon = " ",
                        icon_hl = "@variable",
                        desc = "Files",
                        group = "label",
                        action = function()
                            require("telescope.builtin").find_files()
                        end,
                        key = "f",
                    },
                },
            },
        },
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },
}
