return {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    -- Build the preview app (requires node + npm)
    build = "cd app && npm install --no-package-lock",
    init = function()
      -- In remote/headless setups auto-opening a browser often fails.
      -- Print the preview URL so you can open it manually.
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_browser = "" -- don't try to spawn a browser
      vim.g.mkdp_echo_preview_url = 1

      -- Use a stable port; change if it conflicts.
      vim.g.mkdp_port = "8080"

      -- Allow accessing the preview from another device (your local browser).
      vim.g.mkdp_open_to_the_world = 1
      -- Don't hardcode IP (it may change). Leave empty so you can open via current IP manually.
      vim.g.mkdp_open_ip = ""

      vim.g.mkdp_theme = "dark"
      vim.g.mkdp_markdown_css = vim.fn.expand("~/.config/nvim/markdown-style/github-markdown.css")
    end,
  },
}
