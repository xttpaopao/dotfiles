local M = {}

M.opts = {
    signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
    },
    signs_staged = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    current_line_blame = false,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 500,
        ignore_whitespace = false,
    },
    preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "]h", function()
            if vim.wo.diff then
                vim.cmd.normal({ "]h", bang = true })
            else
                gs.nav_hunk("next")
            end
        end, "Git: next hunk")

        map("n", "[h", function()
            if vim.wo.diff then
                vim.cmd.normal({ "[h", bang = true })
            else
                gs.nav_hunk("prev")
            end
        end, "Git: previous hunk")

        map({ "n", "v" }, "<leader>ga", ":Gitsigns stage_hunk<CR>", "Git: stage hunk")
        map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "Git: reset hunk")
        map("n", "<leader>gA", gs.stage_buffer, "Git: stage buffer")
        map("n", "<leader>gR", gs.reset_buffer, "Git: reset buffer")
        map("n", "<leader>gp", gs.preview_hunk, "Git: preview hunk")
        map("n", "<leader>gb", gs.blame_line, "Git: blame line")
        map("n", "<leader>gB", function()
            gs.blame_line({ full = true })
        end, "Git: blame line full")
        map("n", "<leader>gd", gs.diffthis, "Git: diff this")
        map("n", "<leader>gt", gs.toggle_current_line_blame, "Git: toggle line blame")
    end,
}

function M.config()
    require("gitsigns").setup(M.opts)
end

return M
