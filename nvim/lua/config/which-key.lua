local M = {}

M.opts = {
    preset = "modern",
    delay = 500,
    expand = 1,
    notify = true,
    win = {
        border = "rounded",
    },
    spec = {
        { "<leader>f", group = "find" },
        { "<leader>b", group = "buffer" },
        { "<leader>c", group = "code" },
        { "<leader>d", group = "diagnostic" },
        { "<leader>g", group = "git" },
        { "<leader>l", group = "lsp" },
        { "<leader>t", group = "terminal/toggle" },
        { "<leader>u", group = "ui" },
        { "<leader>w", group = "window" },
        { "<leader>e", desc = "Explorer: toggle neo-tree" },
        { "<leader>fm", desc = "Format: file" },
        { "<leader>tg", desc = "Terminal: lazygit" },
        { "<leader>gb", desc = "Git: blame line" },
        { "<leader>gp", desc = "Git: preview hunk" },
        { "<leader>gr", desc = "Git: reset hunk" },
        { "<leader>ga", desc = "Git: stage hunk" },
    },
}

function M.config()
    local wk = require("which-key")
    wk.setup(M.opts)
end

return M
