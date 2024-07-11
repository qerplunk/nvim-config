return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	config = function()
		local nnp = require("no-neck-pain")

		nnp.setup({
			width = 140,
		})

		vim.keymap.set("n", "<leader>tf", "<cmd> NoNeckPain <cr>", { noremap = true, silent = true })
	end,
}
