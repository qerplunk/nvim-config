return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local map = vim.keymap
        local opts = { noremap = true, silent = true }

        local on_attach = function(client, bufnr)
            if client.name == "tsserver" then
                client.server_capabilities.documentFormattingProvider = false
            end

            opts.buffer = bufnr

            opts.desc = "LSP references"
            map.set("n", "gR", "<cmd> Telescope lsp_references <cr>", opts)

            --opts.desc = "Go to definition"
            --map.set("n", "gD", vim.lsp.buf.definition, opts)

            --opts.desc = "Show LSP declaration"
            --map.set("n", "gd", vim.lsp.buf.declaration, opts)

            opts.desc = "Show LSP implementations"
            map.set("n", "gi", vim.lsp.buf.implementation, opts)

            opts.desc = "Show LSP type definitions"
            map.set("n", "gt", vim.lsp.buf.type_definition, opts)

            opts.desc = "See available code actions"
            map.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

            opts.desc = "Show buffer diagnostics"
            map.set("n", "<leader>D", string.format("<cmd> Telescope diagnostics bufrn=%d <cr>", bufnr), opts)

            opts.desc = "Show line diagnostics"
            map.set("n", "<leader>d", vim.diagnostic.open_float, opts)

            opts.desc = "Go to previous diagnostic"
            map.set("n", "gk", vim.diagnostic.goto_prev, opts)

            opts.desc = "Go to next diagnostic"
            map.set("n", "gj", vim.diagnostic.goto_next, opts)

            opts.desc = "Shsw documentation under cursor"
            map.set("n", "K", vim.lsp.buf.hover, opts)

            opts.desc = "Restart LSP"
            map.set("n", "<leader>rs", ":LspRestart <cr>", opts)

            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- LSP setup

        lspconfig["clangd"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["rust_analyzer"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "rust" },
            root_dir = require("lspconfig/util").root_pattern("Cargo.toml"),
            settings = {
                ["rust-analyzer"] = {
                    cargo = {
                        allFeatures = true,
                    },
                },
            },
        })

        --lspconfig["lua_ls"].setup({
        --capabilities = capabilities,
        --on_attach = on_attach,
        --})

        lspconfig["tsserver"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { "typescript-language-server", "--stdio" },
            single_file_support = true,
        })

        lspconfig["tailwindcss"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim", "use" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
    end,
}
