local servers = {
    "lua_ls",
    "clangd",
    "basedpyright",
    "cmake",
    -- "pylsp",
    -- "lemminx",
}

local default_capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_blink, blink = pcall(require, "blink.cmp")
if ok_blink and blink.get_lsp_capabilities then
    default_capabilities = blink.get_lsp_capabilities(default_capabilities)
end

for _, server in ipairs(servers) do
    vim.lsp.config(server, {
        capabilities = vim.deepcopy(default_capabilities),
    })
    vim.lsp.enable(server)
end

vim.diagnostic.config({
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
})

local lsp_attach_group = vim.api.nvim_create_augroup("lsp-attach", { clear = true })
local lsp_highlight_group = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
local lsp_detach_group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_attach_group,
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
        end

        map("gd", vim.lsp.buf.definition, "LSP: Goto definition")
        map("gD", vim.lsp.buf.declaration, "LSP: Goto declaration")
        map("gr", vim.lsp.buf.references, "LSP: Goto references")
        map("gi", vim.lsp.buf.implementation, "LSP: Goto implementation")
        map("K", vim.lsp.buf.hover, "LSP: Hover")
        map("<leader>cr", vim.lsp.buf.rename, "LSP: Rename symbol")
        map("<leader>ca", vim.lsp.buf.code_action, "LSP: Code action")
        map("<leader>lf", function()
            vim.diagnostic.open_float(nil, { focus = false })
        end, "LSP: Show diagnostic")
        map("[d", vim.diagnostic.goto_prev, "LSP: Previous diagnostic")
        map("]d", vim.diagnostic.goto_next, "LSP: Next diagnostic")
        map("<leader>td", function()
            local current = vim.diagnostic.config().virtual_text
            local enabled = not current
            vim.diagnostic.config({
                underline = enabled,
                virtual_text = enabled,
                signs = enabled,
                update_in_insert = false,
            })
        end, "LSP: Toggle diagnostics")

        if client and client:supports_method("textDocument/foldingRange") then
            vim.wo.foldexpr = "v:lua.vim.lsp.foldexpr()"
        end

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map("<leader>th", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }), { bufnr = event.buf })
            end, "LSP: Toggle inlay hints")
        end

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) and vim.bo.filetype ~= "bigfile" then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = lsp_highlight_group,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = lsp_highlight_group,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
                buffer = event.buf,
                group = lsp_detach_group,
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = lsp_highlight_group, buffer = event2.buf })
                end,
            })
        end
    end,
})
