return {
	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({
				filetype_exclude = {
					"text",
					"netrw",
					"tutor",
				},
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "VeryLazy",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = true,
				},
				per_filetype = {
					["html"] = {},
				},
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			local highlight = {
				"Gray",
			}

			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "Gray", { fg = "#252525" })
			end)
			require("ibl").setup({
				indent = { highlight = highlight },
				whitespace = {
					highlight = highlight,
					remove_blankline_trail = false,
				},
				scope = { enabled = false },
				exclude = {
					filetypes = { "text" },
				},
			})
		end,
	},
}
