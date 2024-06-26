--local map = vim.api.nvim_set_keymap
local map = vim.keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- WINDOWS --
-- Splitting
map.set("n", "<leader>wv", "<cmd> vsplit <cr>", opts) -- vertically
map.set("n", "<leader>ws", "<cmd> split <cr>", opts) -- horizontally
-- Jumping
map.set("n", "<leader>ww", "<C-w>p", opts) -- recent

map.set("n", "<C-k>", "<C-w>k", opts) -- up
map.set("n", "<C-j>", "<C-w>j", opts) -- down
map.set("n", "<C-h>", "<C-w>h", opts) -- left
map.set("n", "<C-l>", "<C-w>l", opts) -- right
map.set("n", "<leader>wk", "<C-w>k", opts) -- up
map.set("n", "<leader>wj", "<C-w>j", opts) -- down
map.set("n", "<leader>wh", "<C-w>h", opts) -- left
map.set("n", "<leader>wl", "<C-w>l", opts) -- right

-- Moving windows
map.set("n", "<leader>wK", "<C-w>K", opts) -- up
map.set("n", "<leader>wJ", "<C-w>J", opts) -- down
map.set("n", "<leader>wH", "<C-w>H", opts) -- left
map.set("n", "<leader>wL", "<C-w>L", opts) -- right

map.set("n", "<leader>wc", "<cmd> close <cr>", opts) -- quit file but not delete buffer

-- Focus on current buffer
map.set("n", "<leader>wf", function()
	Focus = not Focus
	print("Focus on buffer:", Focus)
	if Focus then
		vim.cmd("resize | vertical resize")
	else
		vim.cmd("wincmd =")
	end
end)

-- Resizing
map.set("n", "<leader>w<", "<cmd> vertical resize -4 <cr>", opts) -- width -4
map.set("n", "<leader>w>", "<cmd> vertical resize +4 <cr>", opts) -- width +4
map.set("n", "<leader>w-", "<cmd> resize -2 <cr>", opts) -- height -2
map.set("n", "<leader>w+", "<cmd> resize +2 <cr>", opts) -- height +2

-- TELESCOPE
map.set("n", "<leader>.", "<cmd> Telescope find_files <cr>", opts) -- find all files from cwd
map.set("n", "<leader>,", "<cmd> Telescope buffers <cr>", opts) -- list current buffers
map.set(
	"n",
	"<leader>>",
	"<cmd> lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') }) <cr>",
	opts
) -- telescope find file in curr file dir
map.set("n", "<leader>ff", "<cmd> Telescope file_browser path=%:p:h <cr>", opts) -- find file using file_browser from current file dir
map.set("n", "<leader>fg", "<cmd> Telescope live_grep <cr>", opts) -- grep string
map.set("n", "<leader>fr", "<cmd> Telescope oldfiles <cr>", opts) -- find recent file

-- NVIM TREE

map.set("n", "<leader>e", "<cmd> NvimTreeToggle <cr>", opts) -- toggle nvim tree

---- BUFFERS
map.set("n", "<leader>bk", function()
	local num = #vim.split(vim.fn.execute("ls"), "\n") - 1
	-- Delete buffers and replace with next if num > 1
	if num > 1 then
		vim.cmd("bp|bd#")
	else
		vim.cmd("bdelete")
	end
end, opts)

map.set("n", "<leader>bn", "<cmd> bnext <cr>", opts) -- next buffer
map.set("n", "<leader>bp", "<cmd> bprevious <cr>", opts) -- previous buffer
map.set("n", "<leader>bb", "<cmd> b# <cr>", opts) -- recently used buffer
map.set("n", "<leader>bs", "<cmd> new | wincmd p | close <cr>", opts) -- scratch buffer

---- WORKSPACES, TABS
map.set("n", "<leader><Tab>d", "<cmd> tabclose <cr>", opts) -- delete tab
map.set("n", "<leader><Tab>h", "<cmd> tabprevious <cr>", opts) -- previous tab
map.set("n", "<leader><Tab>l", "<cmd> tabnext <cr>", opts) -- next tab
map.set("n", "<leader><Tab>n", "<cmd> tabnew <cr>", opts) -- new tab
--map.set("n", "<leader><Tab>r", "<cmd> lua require('tabline.actions').set_tabname() <cr>", opts) -- rename tab
map.set("n", "<leader><Tab><Tab>", "<cmd> tabs <cr>", opts) -- show all tabs

map.set("n", "<A-h>", "<cmd> tabprevious <cr>", opts) -- next tab
map.set("n", "<A-l>", "<cmd> tabnext <cr>", opts) -- previous tab

----- FILES
-- Opens a new file with given name on the current file's directory
map.set("n", "<leader>fn", function()
	local current_dir = vim.fn.expand("%:p:h") .. "/"
	local name = vim.fn.input("New file name: ", "", "file")

	vim.cmd("new " .. current_dir .. name)
	vim.cmd("wincmd p | close")
end)
map.set("n", "<leader>fs", "<cmd> w <cr>", opts) -- save file
map.set("n", "<leader>qq", "<cmd> q <cr>", opts) -- quit nvim when in last buffer
map.set("n", "<esc>", "<cmd> noh <cr>", opts) -- clears search

---- HARPOON
map.set("n", "<leader>aa", "<cmd> lua require('harpoon.mark').add_file() <cr>", opts)
map.set("n", "<leader>an", "<cmd> lua require('harpoon.ui').nav_next() <cr>", opts)
map.set("n", "<leader>ap", "<cmd> lua require('harpoon.ui').nav_prev() <cr>", opts)
map.set("n", "<leader>am", "<cmd> lua require('harpoon.ui').toggle_quick_menu() <cr>", opts)

map.set("n", "<leader>ah", "<cmd> lua require('harpoon.ui').nav_file(1) <cr>", opts)
map.set("n", "<leader>aj", "<cmd> lua require('harpoon.ui').nav_file(2) <cr>", opts)
map.set("n", "<leader>ak", "<cmd> lua require('harpoon.ui').nav_file(3) <cr>", opts)
map.set("n", "<leader>al", "<cmd> lua require('harpoon.ui').nav_file(4) <cr>", opts)

---- CONCEALING
map.set("n", "<leader>tl", function()
	Conceal = not Conceal
	print("Conceal:", Conceal)
	if Conceal then
		vim.cmd("set conceallevel=3")
	else
		vim.cmd("set conceallevel=0")
	end
end, opts)

map.set("n", "<leader>tL", function()
	MouseConceal = not MouseConceal
	print("Mouse Conceal:", MouseConceal)
	if MouseConceal then
		vim.cmd("set concealcursor=v")
	else
		vim.cmd("set concealcursor=n")
	end
end, opts)
