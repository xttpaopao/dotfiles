return {
    -- ui plugins lists
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require 'config.catppuccin'
        end,
    },
    {
        'stevearc/oil.nvim',
        lazy = false,
        dependencies = { { 'echasnovski/mini.icons', opts = {} } },
        keys = {
            { '-', '<cmd>Oil<cr>', desc = 'Open parent directory' },
        },
        opts = {},
        config = function()
            require 'config.oil'
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {},
        config = function()
            require('config.lualine').config()
        end,
    },
    {
        'akinsho/bufferline.nvim',
        version = '*',
        after = 'catppuccin',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = require('config.bufferline').opts,
        config = function()
            require('config.bufferline').config()
        end,
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap', 'theHamsta/nvim-dap-virtual-text', 'nvim-neotest/nvim-nio' },
        config = function()
            require('nvim-dap-virtual-text').setup()
            require 'config.dapui'
        end,
    },
    {
        'HiPhish/rainbow-delimiters.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        submodules = false,
        main = 'rainbow-delimiters.setup',
        opts = {},
    },
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },
    -- {
    --     'scottmckendry/cyberdream.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         require('config.cyberdream').config()
    --     end,
    -- },
}
