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
-- Treesitter
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

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  -- snippet = {
  --   -- REQUIRED - you must specify a snippet engine
  --   expand = function(args)
  --     vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  --     -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  --     -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  --     -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
  --   end,
  -- },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local langservers = {
  'html',
  'tsserver',
  'jsonls',
  'solargraph',
  'cssls',
  'tailwindcss',
  'sumneko_lua',
}

for _, server in ipairs(langservers) do
  require'lspconfig'[server].setup {capabilities = capabilities}
end



-- ------------------------------------------------------
-- Keymaps
-- ------------------------------------------------------
g.mapleader = ',' -- change the <leader> key to be comma

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

local function nmap(key, mapped_to)
  map('n', key, mapped_to, opts)
end

map('n', '<leader>ev', ':e $MYVIMRC<CR>', opts)
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
