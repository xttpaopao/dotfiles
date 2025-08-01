vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set

map('n', ';', ':', { desc = 'CMD enter command mode' })
map('i', 'jk', '<ESC>')
map('n', '<Esc>', ':nohl<CR>')
map('t', '<ESC><ESC>', '<C-\\><C-n>')

-- copy to clipboard
map('v', '<leader>y', '"+y', { desc = 'copied to clipboard' })

-- paste from clipboad
map('n', '<leader>p', '"+p', { desc = 'paste from clipboard' })

--split and vsplit
map('n', '\\', '<CMD>:sp<CR>', { desc = 'Split window horizontally' })
map('n', '|', '<CMD>:vsp<CR>', { desc = 'Split window vertically' })

-- windows action
map('n', '<C-h>', '<C-w>h', { desc = 'goto left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'goto below window' })
map('n', '<C-k>', '<C-w>k', { desc = 'goto upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'goto right window' })
map('n', '<Tab>', '<CMD>:bn<CR>', { desc = 'goto next buffer' })
map('n', '<S-Tab>', '<CMD>:bp<CR>', { desc = 'goto previous buffer' })
map('n', '<leader>x', '<CMD>:bd<CR>', { desc = 'close current buffer' })
