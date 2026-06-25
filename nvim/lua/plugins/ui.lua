return {
    -- ui plugins lists
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false, -- ensure colorscheme + lualine theme are available before other UI plugins
        config = function()
            require("config.catppuccin")
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = require("config.which-key").opts,
        config = function()
            require("config.which-key").config()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
        opts = {},
        config = function()
            require("config.lualine").config()
        end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        after = "catppuccin",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = require("config.bufferline").opts,
        config = function()
            require("config.bufferline").config()
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPost", "BufNewFile" },
        submodules = false,
        main = "rainbow-delimiters.setup",
        opts = {},
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        cmd = "Neotree",
        keys = {
            { "<leader>e", "<cmd>Neotree toggle left<cr>", desc = "Explorer: toggle neo-tree" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        opts = require("config.neotree").opts,
        config = function()
            require("config.neotree").config()
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "rcarriga/nvim-notify",
        },
        config = function()
            require("config.noice").config()
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {},
        config = function()
            require("config.toggleterm").config()
        end,
    },
}
