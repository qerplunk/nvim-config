local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

---- Windows ----
-- Splitting
map('n', '<leader>wv', '<cmd> vsplit <cr>', opts) -- vertical
map('n', '<leader>ws', '<cmd> split <cr>', opts) -- horizontal
-- Jumping
map('n', '<leader>ww', '<C-w>p', opts) -- recent

map('n', '<C-k>', '<C-w>k', opts) -- up
map('n', '<C-j>', '<C-w>j', opts) -- down
map('n', '<C-h>', '<C-w>h', opts) -- left
map('n', '<C-l>', '<C-w>l', opts) -- right

map('n', '<leader>wk', '<C-w>k', opts) -- up
map('n', '<leader>wj', '<C-w>j', opts) -- down
map('n', '<leader>wh', '<C-w>h', opts) -- left
map('n', '<leader>wl', '<C-w>l', opts) -- right

-- Movement
map('n', '<leader>wK', '<C-w>K', opts) -- up
map('n', '<leader>wJ', '<C-w>J', opts) -- down
map('n', '<leader>wH', '<C-w>H', opts) -- left
map('n', '<leader>wL', '<C-w>L', opts) -- right
-- Resizing
map('n', '<leader>w<', '<cmd> vertical resize -4 <cr>', opts) -- width -4
map('n', '<leader>w>', '<cmd> vertical resize +4 <cr>', opts) -- width +4
map('n', '<leader>w-', '<cmd> resize -2 <cr>', opts) -- height -2
map('n', '<leader>w+', '<cmd> resize +2 <cr>', opts) -- height +2

---- Buffers ----
map('n', '<leader>bk', '<cmd> bp|bd# <cr>', opts) -- delete current buffer
map('n', '<leader>,', '<cmd> Telescope buffers <cr>', opts) -- list current buffers

---- Workspaces, Tabs ----
map('n', '<leader><Tab>d', '<cmd> tabclose <cr>', opts)
map('n', '<leader><Tab>h', '<cmd> tabprevious <cr>', opts)
map('n', '<leader><Tab>l', '<cmd> tabnext <cr>', opts)
map('n', '<leader><Tab>n', '<cmd> tabnew <cr>', opts)
map('n', '<leader><Tab>r', '<cmd> lua require(\'tabline.actions\').set_tabname() <cr>', opts)
map('n', '<leader><Tab><Tab>', '<cmd> tabs <cr>', opts)

---- Files ----
map('n', '<leader>.', '<cmd> Telescope find_files <cr>', opts) -- find file
map('n', '<leader>ff', '<cmd> Telescope file_browser path=%:p:h <cr>', opts) -- find file using file_browser
map('n', '<leader>fg', '<cmd> Telescope live_grep <cr>', opts) -- grep string
map('n', '<leader>fr', '<cmd> Telescope oldfiles <cr>', opts) -- find recent file
map('n', '<leader>fs', '<cmd> w <cr>', opts) -- save file
map('n', '<leader>wc', '<cmd> close <cr>', opts) -- quit file but not delete buffer
map('n', '<leader>qq', '<cmd> q <cr>', opts) -- quit nvim when in last buffer
map('n', '<esc>', '<cmd> noh <cr>', opts) -- clears search

---- Toggles ----
map('n', '<leader>th', '<cmd> TSBufToggle highlight <cr>', opts) -- toggle treesitter highlighting
map('n', '<leader>td', '<cmd> Telescope diagnostics <cr>', opts) -- toggle telescope diagnostics
map('n', '<leader>tcf', '<cmd> lua require(\'cmp\').setup.buffer { enabled = false } <cr>', opts) -- cmp completion on
map('n', '<leader>tct', '<cmd> lua require(\'cmp\').setup.buffer { enabled = true } <cr>', opts) -- cmp completion off

---- Open ----
map('n', '<leader>ot', '<cmd> terminal <cr> <cmd> startinsert <cr>', opts) -- opens a terminal in current tab
map('n', '<leader>oT', '<cmd> vsplit | terminal <cr> <cmd> startinsert <cr>', opts) -- opens a terminal in new window
map('t', '<C-g>', '<C-\\><C-n>', opts) -- toggle out of terminal mode

---- Format -----
map('n', '<leader>ft', '<cmd>%s/\\s\\+$//e<cr> | <cmd>noh<cr>', opts)


--vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  --pattern = { "*" },
  --command = [[%s/\s\+$//e]],
--})

---------- Better Escape ----------
require("better_escape").setup {
    mapping = {"jk"},
    timeout = 250,
}
