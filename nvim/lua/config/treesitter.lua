-- Treesitter configuration
-- NOTE: nvim-treesitter (newer versions) uses `nvim-treesitter.config` instead of `nvim-treesitter.configs`.

require('nvim-treesitter.config').setup {
  ensure_installed = {
    'bash',
    'python',
    'cpp',
    'diff',
    'xml',
    'lua',
    'luadoc',
    'markdown',
    'markdown_inline',
    'vim',
    'vimdoc',
  },
  auto_install = true,
  highlight = {
    enable = true,
  },
  disable = function(_, bufnr)
    return vim.api.nvim_buf_line_count(bufnr) > 5000
  end,
  indent = { enable = true },
}
