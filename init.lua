require("settings")
require("mappings")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	ui = {
		border = "single",
	},
}

require("lazy").setup("plugins", opts)

vim.cmd("colorscheme kanagawa-dragon")

vim.cmd("highlight CursorLine guibg=#25282f")
vim.cmd(string.format("highlight Whitespace guifg=%s", "#2a2a2a"))
