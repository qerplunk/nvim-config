vim.opt.number = true
vim.opt.nuw = 4
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.showmatch = true
vim.opt.ignorecase = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

vim.opt.foldlevelstart = 20

vim.opt.ai = true
vim.opt.si = true

vim.opt.list = true

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.scrolloff = 0
vim.opt.fileencoding = 'utf-8'
vim.opt.termguicolors = true

vim.opt.hidden = true
vim.opt.background = dark
vim.opt.confirm = true
vim.opt.timeoutlen = 300

vim.opt.conceallevel = 3
vim.opt.concealcursor = 'c'

vim.opt.lazyredraw = true

--local palettes = {
    --all = {
        ----bg0 = "#21242b",
        --bg0 = "#1c2023",
        ----bg1 = "#1e1e1e",
        --bg1 = "#1a1b1c",
    --},
--}
--require("nightfox").setup({palettes = palettes})

--vim.cmd("colorscheme terafox")
vim.cmd("colorscheme kanagawa")
--vim.cmd("highlight Cursor guibg=#FFFFFF")
--vim.cmd("highlight CursorLine guibg=#21242b")
vim.cmd("highlight CursorLine guibg=#2a2d33")
--vim.cmd("highlight CursorLineNR guibg=#21242b")
--vim.cmd("highlight LineNr guifg=#91949b")
--vim.cmd("highlight LineNr guibg=#252525")

vim.opt.completeopt = {"menu", "menuone", "noselect"}
