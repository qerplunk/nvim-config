return {
	{
		"L3Mon4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")

			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					--["<S-Tab>"] = cmp.mapping.select_prev_item(),
					--["<Tab>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<cr>"] = cmp.mapping.confirm({ select = true }),
					["<C-l>"] = cmp.mapping(function(fallback)
						if luasnip.jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function(fallback)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "nvim_lsp" },
				}),
				formatting = {
					format = lspkind.cmp_format({
						with_text = true,
						menu = {
							nvim_lsp = "[LSP]",
							buffer = "[buf]",
							nvim_lua = "[api]",
							path = "[path]",
							luasnip = "[snip]",
							gh_issues = "[issues]",
						},
					}),
				},
			})
		end,
	},
}
