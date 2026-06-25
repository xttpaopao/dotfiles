require("mason").setup({
    ui = {
        border = "single",
        width = 0.7,
        height = 0.7,
    },
})

require("mason-tool-installer").setup({
    ensure_installed = {
        -- LSP
        "lua-language-server",
        "basedpyright",
        "clangd",
        "cmake-language-server",
        -- LINTER / FORMATTER
        "ruff",
        "clang-format",
        "cmakelang",
        "stylua",
        "prettier",
    },
    auto_update = false,
    run_on_start = true,
})
