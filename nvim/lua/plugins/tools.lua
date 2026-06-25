return {
    -- tool plugins lists
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
        config = function()
            require("config.treesitter")
        end,
    },
    {
        "williamboman/mason.nvim",
        event = { "BufReadPost", "BufNewFile", "VimEnter" },
        dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
        opts = {},
        config = function()
            require("config.mason")
        end,
    },
    {
        "saghen/blink.cmp",
        version = "1.*",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "xzbdmw/colorful-menu.nvim", "rafamadriz/friendly-snippets" },
        opts = require("config.blink").opts,
    },
    {
        "stevearc/conform.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
        config = function()
            require("config.conform")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = require("config.gitsigns").opts,
        config = function()
            require("config.gitsigns").config()
        end,
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = require("config.snacks").opts,
        config = function()
            require("config.snacks").config()
        end,
    },
    {
        "altermo/ultimate-autopair.nvim",
        event = { "InsertEnter" },
        opts = require("config.autopair").opts,
        config = function()
            require("config.autopair").config()
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        opts = {},
    },
}
