require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },

        python = { "ruff_format" },

        c = { "clang-format" },
        cpp = { "clang-format" },
        cmake = { "cmake_format" },

        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})

local map = function(key, func, desc)
    vim.keymap.set("n", key, func, { desc = desc })
end

-- keymap
map("<leader>fm", function()
    require("conform").format()
end, "Format: file")
