-- ------------------------------------------------------
-- Global Settings
-- ------------------------------------------------------
local opt = vim.opt
local cmd = vim.cmd

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
opt.termguicolors = true -- True color support
opt.joinspaces = false -- No double spaces with join
opt.list = true -- Show some invisible characters
opt.wildmode = {'list', 'longest'} -- Command-line completion mode
opt.wrap = false -- Disable line wrap

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
