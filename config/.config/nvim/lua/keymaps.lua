-- ------------------------------------------------------
-- Keymaps
-- ------------------------------------------------------
local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

g.mapleader = ',' -- change the <leader> key to be comma

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

local function nmap(key, mapped_to)
  map('n', key, mapped_to, opts)
end

map('n', '<leader>ev', ':tabedit $MYVIMRC<CR>', opts)
map('n', '<leader>ep', ':tabedit ~/.config/nvim/lua/plugins.lua<CR>', opts)
map('n', '<leader>sv', ':source $MYVIMRC<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>Q', ':q!<CR>', opts)
map('n', '<leader>s', ':w<CR>', opts)
map('n', '<c-s>', ':w<CR>', {})
map('i', '<c-s>', '<Esc>:w<CR>a', {})
-- split navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
-- escaping
map('i', 'jk', '<ESC>', opts)
map('i', 'kj', '<ESC>', opts)
-- indenting
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
-- After searching, pressing escape stops the highlight
map("n", "<esc>", ":noh<cr>", { silent = true })
-- Keep search results centred
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts)
-- Tab to switch buffers in Normal mode
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
-- Telescope
map("n", "<leader>f", '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map('n', '<leader>g', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
map('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
-- LSP
nmap('gd', ':lua vim.lsp.buf.definition()<cr>')
nmap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nmap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nmap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nmap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nmap('gr', ':lua vim.lsp.buf.references()<cr>')
nmap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nmap('K', ':lua vim.lsp.buf.hover()<cr>')
nmap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nmap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nmap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
-- Startify
map('n', '<c-n>', ':Alpha<cr>', opts)
-- :NvimTree
map('n', '<leader>t', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>tr', ':NvimTreeRefresh<CR>', opts)
map('n', '<leader>tf', ':NvimTreeFindFile<CR>', opts)
-- Renaming
-- map("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
-- map("n", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
-- map("v", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })