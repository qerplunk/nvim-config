local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- C, C++
require('lspconfig').ccls.setup{
    capabilities = capabilities,
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {buffer=0})

        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})

        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
    end,
    flags = lsp_flags,
}

-- RUST
require('lspconfig').rust_analyzer.setup{
    capabilities = capabilities,
    on_attach = function()
        vim.keymap.set("n", "K",  vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
    end,
    flags = lsp_flags,
    settings = {
        ["rust-analyzer"] = {}
    }
}

