local M = {}

M.opts = {
    bigfile = {
        enabled = true,
    },
    indent = {
        enabled = true,
        char = '┆',
        only_scope = false,
        only_current = false,
    },
    image = {},
    scope = {
        enabled = true,
    },
    explorer = {
        enabled = false,
    },
    terminal = {
        enabled = true,
    },
    lazygit = {
        enabled = true,
    },
    input = {
        enabled = true,
    },
    styles = {
        terminal = {
            relative = 'editor',
            border = 'rounded',
            position = 'float',
            backdrop = 60,
            height = 0.9,
            width = 0.9,
            zindex = 50,
        },
    },
}

function M.config()
    local opts = M.opts
    require('snacks').setup(opts)
    local map = function(key, func, desc)
        vim.keymap.set('n', key, func, { desc = desc })
    end

    -- all keymaps for snacks.picker
    map('<leader>ff', Snacks.picker.smart, 'Smart find file')
    map('<leader>fo', Snacks.picker.recent, 'Find recent file')
    map('<leader>fw', Snacks.picker.grep, 'Find content')
    map('<leader>fh', Snacks.picker.help, 'Find in help')
    -- terminal
    map('<A-h>', Snacks.terminal.toggle, 'toggle terminal')
    -- lazygit
    map('<A-g>', Snacks.lazygit.open, 'open lazygit')
end

return M
