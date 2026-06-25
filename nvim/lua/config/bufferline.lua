local M = {}

M.opts = {}

function M.config()
  require("bufferline").setup({
    options = {
      style_preset = {
        require("bufferline").style_preset.no_italic,
        require("bufferline").style_preset.no_bold,
        require("bufferline").style_preset.minimal,
      },
      offsets = {
        {

          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
    },
  })
end

return M
