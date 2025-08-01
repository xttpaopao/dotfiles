-- -- Declare a global function to retrieve the current directory
-- function _G.get_oil_winbar()
--     local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
--     local dir = require('oil').get_current_dir(bufnr)
--     if dir then
--         return vim.fn.fnamemodify(dir, ':~')
--     else
--         -- If there is no current directory (e.g. over ssh), just show the buffer name
--         return vim.api.nvim_buf_get_name(0)
--     end
-- end

require('oil').setup {
    -- win_options = {
    --     winbar = '%!v:lua.get_oil_winbar()',
    -- },
    default_file_explorer = true,

    buf_options = {
        buflisted = false,
        bufhidden = 'hide',
    },
    win_options = {
        wrap = false,
        signcolumn = 'no',
        cursorcolumn = false,
        foldcolumn = '0',
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = 'nvic',
    },
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    keymaps = {
        ['g?'] = { 'actions.show_help', mode = 'n' },
        ['<CR>'] = 'actions.select',
        ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
        -- ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
        ['<C-t>'] = { 'actions.select', opts = { tab = true } },
        ['<C-p>'] = 'actions.preview',
        ['<C-c>'] = { 'actions.close', mode = 'n' },
        -- ['<C-l>'] = 'actions.refresh',
        -- ['<CR>'] = false,
        -- ['<C-s>'] = false,
        ['<C-h'] = false,
        -- ['<C-t'] = false,
        -- ['<C-p'] = false,
        -- ['<C-c'] = false,
        ['<C-l'] = false,
        ['-'] = { 'actions.parent', mode = 'n' },
        ['_'] = { 'actions.open_cwd', mode = 'n' },
        ['`'] = { 'actions.cd', mode = 'n' },
        ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
        ['gs'] = { 'actions.change_sort', mode = 'n' },
        ['gx'] = 'actions.open_external',
        ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
        ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
    },
    use_default_keymaps = false,
    float = {
        -- Padding around the floating window
        padding = 1,
        -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        max_width = 0,
        max_height = 0,
        border = 'rounded',
        win_options = {
            winblend = 0,
        },
        -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
        get_win_title = nil,
        -- preview_split: Split direction: "auto", "left", "right", "above", "below".
        preview_split = 'auto',
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
            return conf
        end,
    },
    vim.keymap.set('n', '<A-e>', function()
        require('oil').toggle_float()
    end, { desc = 'toggle oil' }),
    vim.keymap.set('n', '<leader>e', function()
        require('oil').open()
    end, { desc = 'open oil buffer' }),
}
-- toggle oil win
