require('nvim-treesitter.configs').setup {
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
  disable = function(lang, bufnr)
    return vim.api.nvim_buf_line_count(bufnr) > 5000
  end,
  indent = { enable = true, },
}