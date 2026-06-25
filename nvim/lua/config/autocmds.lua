--auto commands
vim.api.nvim_create_augroup("IrreplaceableWindows", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = "IrreplaceableWindows",
    pattern = "*",
    callback = function()
        local filetypes = { "neo-tree", "snacks_terminal" }
        local buftypes = { "terminal" }
        if vim.tbl_contains(buftypes, vim.bo.buftype) and vim.tbl_contains(filetypes, vim.bo.filetype) then
            vim.cmd("set winfixbuf")
        end
    end,
})
