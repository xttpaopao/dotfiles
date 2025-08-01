require('conform').setup {
    formatters_by_ft = {
        lua = { 'stylua' },

        python = { 'ruff' },

        cpp = { 'clang-format' },

        xml = { 'xmlformatter' },

        json = { 'prettier' },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
    },
}

local map = function(key, func, desc)
    vim.keymap.set('n', key, func, { desc = desc })
end

-- keymap
map('<leader>fm', function()
    require('conform').format()
end, 'format file by conform')
