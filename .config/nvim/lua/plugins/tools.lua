return {
    -- tool plugins lists
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {},
        config = function()
            require 'config.treesitter'
        end,
    },
    {
        'williamboman/mason.nvim',
        event = { 'BufReadPost', 'BufNewFile', 'VimEnter' },
        opts = {},
        config = function()
            require 'config.mason'
        end,
    },
    {
        'saghen/blink.cmp',
        version = '1.*',
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = { 'xzbdmw/colorful-menu.nvim', 'rafamadriz/friendly-snippets' },
        opts = require('config.blink').opts,
    },
    {
        'stevearc/conform.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {},
        config = function()
            require 'config.conform'
        end,
    },
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        opts = require('config.snacks').opts,
        config = function()
            require('config.snacks').config()
        end,
    },
    {
        'altermo/ultimate-autopair.nvim',
        event = { 'InsertEnter' },
        opts = require('config.autopair').opts,
        config = function()
            require('config.autopair').config()
        end,
    },
    {
        'mfussenegger/nvim-dap',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = require('config.dap').opts,
        config = function()
            require('config.dap').config()
        end,
    },
    { -- python debugger
        'mfussenegger/nvim-dap-python',
        dependencies = {
            'mfussenegger/nvim-dap',
            'rcarriga/nvim-dap-ui',
        },
        keys = {
            { '<leader>db', ft = 'python' },
            { '<leader>ds', ft = 'python' },
            { '<leader>du', ft = 'python' },
        },
        config = function()
            local path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
            require('dap-python').setup(path)
        end,
    },
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        opts = {},
    },
}
