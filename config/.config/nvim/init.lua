local cmd = vim.cmd
local g = vim.g
local opt = vim.opt
local api = vim.api
local map = vim.api.nvim_set_keymap

 
-- ------------------------------------------------------
-- Plugins management via Packer
-- ------------------------------------------------------
require("plugins")

require('nvim_comment').setup()
require('lualine').setup()

-- ------------------------------------------------------
-- Keymaps
-- ------------------------------------------------------
g.mapleader = ',' -- change the <leader> key to be comma
map('n', '<leader>ev', ':e $MYVIMRC<CR>', {noremap = true, silent = false})
map('n', '<leader>ep', ':tabedit ~/.config/nvim/lua/plugins.lua<CR>', {noremap = true, silent = false})
map('n', '<leader>sv', ':source $MYVIMRC<CR>', {noremap = true, silent = false})
map('n', '<leader>q', ':q<CR>', {noremap = true, silent = false})
map('n', '<leader>Q', ':q!<CR>', {noremap = true, silent = false})
map('n', '<leader>s', ':w<CR>', {noremap = true, silent = false})
-- split navigation
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})
-- escaping
map('i', 'jk', '<ESC>', {noremap = true, silent = false})
map('i', 'kj', '<ESC>', {noremap = true, silent = false})
-- indenting
map('v', '<', '<gv', {noremap = true, silent = false})
map('v', '>', '>gv', {noremap = true, silent = false})
-- After searching, pressing escape stops the highlight
map("n", "<esc>", ":noh<cr>", { silent = true })
-- Keep search results centred
map("n", "n", "nzzzv", {noremap = true, silent = false})
map("n", "N", "Nzzzv", {noremap = true, silent = false})
map("n", "J", "mzJ`z", {noremap = true, silent = false})
-- Tab to switch buffers in Normal mode
map("n", "<Tab>", ":bnext<CR>", {noremap = true, silent = false})
map("n", "<S-Tab>", ":bprevious<CR>", {noremap = true, silent = false})

-- ------------------------------------------------------
-- Global Settings
-- ------------------------------------------------------
cmd('filetype plugin indent on')
opt.backup = false
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.clipboard = 'unnamedplus'
opt.encoding = 'UTF-8'
opt.errorbells = false
opt.fillchars = { vert = ' ' }
opt.ignorecase = true
opt.hidden = true  
opt.hlsearch = true
opt.listchars = { tab = ">>>", trail = "·", precedes = "←", extends = "→",eol = "↲", nbsp = "␣" }
opt.mouse = 'a'
opt.shortmess:append { c = true, S = true }
opt.showcmd = true
opt.showmatch = true
opt.showmode = true
opt.showtabline = 3
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 5 -- start scrolling when within 5 lines near the top/bottom
opt.smartcase = true
opt.switchbuf = 'useopen' -- use an already open window if possible
opt.textwidth = 0 -- never wrap lines
opt.undolevels = 1000
opt.writebackup = false -- no tilde files
opt.wrapscan = true	-- wrap searches around top/bottom of file

-- Buffer
local indent = 2
opt.expandtab = true
opt.fileformat = 'unix'
opt.softtabstop = indent
opt.spelllang = 'en'
opt.swapfile = false
opt.shiftwidth = indent
opt.tabstop = indent
opt.undofile = false

-- Window
opt.number = true
opt.colorcolumn = "+1"
opt.foldmethod = 'indent'
opt.foldlevel = 1
opt.list = false
opt.foldnestmax = 10
opt.signcolumn = 'yes'
opt.relativenumber = true
opt.foldenable = false
opt.cursorline = true
