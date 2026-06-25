local M = {}

M.opts = {
    completion = {
        documentation = {
            auto_show = true,
        },
        list = {
            selection = {
                preselect = false,
            },
        },
        menu = {
            draw = {
                columns = { { 'kind_icon' }, { 'label', gap = 1 } },
                components = {
                    label = {
                        text = function(ctx)
                            return require('colorful-menu').blink_components_text(ctx)
                        end,
                        highlight = function(ctx)
                            return require('colorful-menu').blink_components_highlight(ctx)
                        end,
                    },
                },
            },
        },
    },
    keymap = {
        preset = 'enter',
        ['<tab>'] = { 'select_next', 'fallback' },
        ['<S-tab>'] = { 'select_prev', 'fallback' },
    },
    signature = {
        enabled = true,
    },
    cmdline = {
        completion = {
            menu = {
                auto_show = true,
            },
            list = {
                selection = {
                    preselect = false,
                },
            },
        },
    },
    appearance = {
        nerd_font_variant = 'mono',
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
            snippets = { score_offset = 1000 },
        },
    },
}

function M.config()
    require('blink.cmp').setup {}
end

return M
