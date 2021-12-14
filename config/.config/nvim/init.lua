local cmd = vim.cmd
local g = vim.g
local opt = vim.opt
-- ------------------------------------------------------
-- Plugins management via Packer
-- ------------------------------------------------------
require("plugins")

vim.cmd [[colorscheme codedark]]

require('nvim_comment').setup()
require('lualine').setup()
require('telescope').setup()
require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  indent = {
    enable = true,
  }
}
-- This folding setting will respect your foldminlines and foldnestmax settings.
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  if server.name == "sumneko_lua" then
    opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' }
          },
        }
      }
    }
  end
  server:setup(opts)
end)

-- ------------------------------------------------------
-- Keymaps
-- ------------------------------------------------------
g.mapleader = ',' -- change the <leader> key to be comma

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

local function nkeymap(key, map)
  keymap('n', key, map, opts)
end

keymap('n', '<leader>ev', ':e $MYVIMRC<CR>', opts)
keymap('n', '<leader>ep', ':tabedit ~/.config/nvim/lua/plugins.lua<CR>', opts)
keymap('n', '<leader>sv', ':source $MYVIMRC<CR>', opts)
keymap('n', '<leader>q', ':q<CR>', opts)
keymap('n', '<leader>Q', ':q!<CR>', opts)
keymap('n', '<leader>s', ':w<CR>', opts)
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

-- split navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
-- escaping
keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'kj', '<ESC>', opts)
-- indenting
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)
-- After searching, pressing escape stops the highlight
keymap("n", "<esc>", ":noh<cr>", { silent = true })
-- Keep search results centred
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)
-- Tab to switch buffers in Normal mode
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
-- Telescope
keymap("n", "<leader>f", '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
keymap('n', '<leader>g', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
keymap('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
-- LSP
nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
-- Renaming
-- map("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
-- map("n", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
-- map("v", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

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
