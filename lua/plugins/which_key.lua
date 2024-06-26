return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		wk.setup({
			ignore_missing = false,
		})
		wk.register({
			-- Harpoon
			a = {
				name = "Harpoon",
				a = "Add file",
				h = "File 1",
				j = "File 2",
				k = "File 3",
				l = "File 4",
				m = "Menu",
				n = "Next",
				p = "Previous",
			},
			-- Buffers
			b = {
				name = "Buffer",
				b = "Go to recent buffer",
				f = "Format buffer",
				k = "Delete current buffer",
				n = "Next buffer",
				p = "Previous buffer",
				s = "Scratch buffer",
			},
			-- Files
			e = {
				name = "Nvim Tree",
			},
			f = {
				name = "File",
				f = {
					name = "Telescope File Browser",
				},
				g = "Grep find",
				n = "New file",
				r = "Find recent file",
				s = "Save file",
			},
			-- Toggles
			t = {
				name = "Toggle",
				c = "cmp",
				d = "Telescope diagnostics",
				h = "Treesitter highlighting",
				l = "Norg conceal",
				L = "Norg conceal on cursor line",
			},
			-- Open
			o = {
				name = "Open",
				t = "Terminal on current window",
				T = "Terminal on new window",
			},
			q = {
				name = "Quit",
				q = "Quit nvim",
			},
			-- Windows
			w = {
				name = "Window",
				v = "Vertical split",
				s = "Horizontal split",

				w = "Jump to recent window",
				k = "Jump to window up",
				j = "Jump to window down",
				h = "Jump to window left",
				l = "Jump to window right",

				K = "Move window up",
				J = "Move window down",
				H = "Move window left",
				L = "Move window right",

				f = "Focus on window",

				["+"] = "Increase height",
				["-"] = "Decrease height",
				[">"] = "Increase width",
				["<"] = "Decrease width",

				c = "Close window",
			},
			-- Workspaces
			["<Tab>"] = {
				name = "Tab",
				d = "Delete tab",
				l = "Next tab",
				n = "New tab",
				h = "Previous tab",
				r = "Rename tab",
				["<Tab>"] = "Show tabs",
			},
		}, { prefix = "<leader>" })
	end,
}
