local M = {}

function M.config()
    require("toggleterm").setup({
        size = function(term)
            if term.direction == "horizontal" then
                return 12
            elseif term.direction == "vertical" then
                return math.floor(vim.o.columns * 0.4)
            else
                return 20
            end
        end,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_terminals = false,
        shell = "/usr/bin/fish",
        auto_scroll = true,
        direction = "horizontal",
        start_in_insert = true,
        persist_mode = true,
        close_on_exit = false,
        float_opts = {
            border = "curved",
        },
        winbar = {
            enabled = false,
        },
    })

    local Terminal = require("toggleterm.terminal").Terminal

    local main_term = Terminal:new({
        direction = "horizontal",
        hidden = true,
    })

    local float_term = Terminal:new({
        direction = "float",
        hidden = true,
    })

    local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        hidden = true,
        close_on_exit = false,
    })

    local map = vim.keymap.set

    -- leader-based terminal workflow
    map("n", "<leader>tt", function()
        main_term:toggle()
    end, { desc = "Terminal: toggle main" })

    map("n", "<leader>tf", function()
        float_term:toggle()
    end, { desc = "Terminal: toggle floating" })

    map("n", "<leader>tg", function()
        lazygit:toggle()
    end, { desc = "Terminal: lazygit" })

    -- terminal-mode ergonomics
    map("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Terminal: normal mode" })
    map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Terminal: window left" })
    map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Terminal: window down" })
    map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Terminal: window up" })
    map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Terminal: window right" })
end

return M
