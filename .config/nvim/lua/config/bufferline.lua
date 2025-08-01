local M = {}

M.opts = {}

function M.config()
    require('bufferline').setup {
        -- highlights = require('catppuccin.groups.integrations.bufferline').get(),
        options = {
            style_preset = {
                require('bufferline').style_preset.no_italic,
                require('bufferline').style_preset.no_bold,
                require('bufferline').style_preset.minimal,
            },
        },
    }
end

return M
