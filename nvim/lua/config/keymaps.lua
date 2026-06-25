vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<Esc>", ":nohl<CR>")
map("t", "<ESC><ESC>", "<C-\\><C-n>")

-- copy to clipboard
map("v", "<leader>y", '"+y', { desc = "copied to clipboard" })

-- paste from clipboad
map("n", "<leader>p", '"+p', { desc = "paste from clipboard" })

-- split and vsplit
map("n", "\\", "<CMD>:sp<CR>", { desc = "Window: split horizontal (legacy)" })
map("n", "|", "<CMD>:vsp<CR>", { desc = "Window: split vertical (legacy)" })

-- windows action
map("n", "<C-h>", "<C-w>h", { desc = "Window: goto left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window: goto below" })
map("n", "<C-k>", "<C-w>k", { desc = "Window: goto upper" })
map("n", "<C-l>", "<C-w>l", { desc = "Window: goto right" })
map("n", "<leader>ws", "<CMD>:sp<CR>", { desc = "Window: split horizontal" })
map("n", "<leader>wv", "<CMD>:vsp<CR>", { desc = "Window: split vertical" })
map("n", "<leader>wc", "<C-w>c", { desc = "Window: close current" })
map("n", "<leader>wo", "<C-w>o", { desc = "Window: close others" })
map("n", "<leader>q", "<C-w>c", { desc = "Window: close current (legacy)" })

-- buffers
map("n", "<Tab>", "<CMD>:bn<CR>", { desc = "Buffer: next" })
map("n", "<S-Tab>", "<CMD>:bp<CR>", { desc = "Buffer: previous" })
map("n", "<leader>bn", "<CMD>:bn<CR>", { desc = "Buffer: next" })
map("n", "<leader>bp", "<CMD>:bp<CR>", { desc = "Buffer: previous" })
map("n", "<leader>bd", function()
    Snacks.bufdelete()
end, { desc = "Buffer: delete current" })
map("n", "<leader>bo", function()
    Snacks.bufdelete.other()
end, { desc = "Buffer: delete others" })
map("n", "<leader>ba", function()
    Snacks.bufdelete.all()
end, { desc = "Buffer: delete all" })
map("n", "<leader>x", function()
    Snacks.bufdelete()
end, { desc = "Buffer: delete current (legacy)" })

-- diagnostics
map("n", "<leader>dd", function()
    vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Diagnostic: show line" })
map("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Diagnostic: next" })
map("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Diagnostic: previous" })
