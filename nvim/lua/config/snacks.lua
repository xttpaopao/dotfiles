local M = {}

M.opts = {
    bigfile = {
        enabled = true,
    },
    indent = {
        enabled = true,
        char = "┆",
        only_scope = false,
        only_current = false,
    },
    image = {},
    scope = {
        enabled = true,
    },
    explorer = {
        enabled = false,
    },
    terminal = {
        enabled = false,
    },
    lazygit = {
        enabled = true,
    },
    input = {
        enabled = true,
    },
    styles = {},
    picker = {
        enabled = true,
    },
    dashboard = {
        preset = {
            header = [[
    ██████  ████                        
   ███▒▒███▒▒███                        
  ▒███ ▒▒▒  ▒███  █████ ████ █████ █████
 ███████    ▒███ ▒▒███ ▒███ ▒▒███ ▒▒███ 
▒▒▒███▒     ▒███  ▒███ ▒███  ▒▒▒█████▒  
  ▒███      ▒███  ▒███ ▒███   ███▒▒▒███ 
  █████     █████ ▒▒████████ █████ █████
 ▒▒▒▒▒     ▒▒▒▒▒   ▒▒▒▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒▒▒ 
                                        
                                        
                                        ]],
        },
    },
}

function M.config()
    local opts = M.opts
    require("snacks").setup(opts)
    local map = function(key, func, desc)
        vim.keymap.set("n", key, func, { desc = desc })
    end

    -- all keymaps for snacks.picker
    map("<leader>ff", Snacks.picker.smart, "Find: files")
    map("<leader>fr", Snacks.picker.recent, "Find: recent files")
    map("<leader>fo", Snacks.picker.recent, "Find: recent files (legacy)")
    map("<leader>fg", Snacks.picker.grep, "Find: grep content")
    map("<leader>fw", Snacks.picker.grep, "Find: grep content (legacy)")
    map("<leader>fh", Snacks.picker.help, "Find: help")

    -- git picker workflow; lazygit stays under <leader>tg, not <leader>gg
    map("<leader>gf", Snacks.picker.git_files, "Git: files")
    map("<leader>gl", Snacks.picker.git_log, "Git: log")
    map("<leader>gs", Snacks.picker.git_status, "Git: status")
end

return M
