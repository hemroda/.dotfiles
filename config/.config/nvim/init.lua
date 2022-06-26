-- ------------------------------------------------------
-- Variables
-- ------------------------------------------------------
local opt = vim.opt
local cmd = vim.cmd
local g = vim.g
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

local function nmap(key, mapped_to)
  map('n', key, mapped_to, opts)
end


-- ------------------------------------------------------
-- Keymaps
-- ------------------------------------------------------
g.mapleader = ',' -- change the <leader> key to be comma
map('n', '<leader>ev', ':tabedit $MYVIMRC<CR>', opts)
map('n', '<leader>ep', ':tabedit ~/.config/nvim/lua/plugins.lua<CR>', opts)
map('n', '<leader>v', ':source $MYVIMRC<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>Q', ':q!<CR>', opts)
map('n', '<leader>s', ':w<CR>', opts)
map('n', '<c-s>', ':w<CR>', {})
map('i', '<c-s>', '<Esc>:w<CR>', {})
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

-- NvimTree
map('n', '<leader>t', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>tr', ':NvimTreeRefresh<CR>', opts)
map('n', '<leader>tf', ':NvimTreeFindFile<CR>', opts)
map('n', '<leader>t-', ':NvimTreeCollapse<CR>', opts)

-- Telescope
map("n", "<leader>f", '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map("n", "<leader>cf", '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_ivy())<cr>', opts)
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

-- Buffer
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
map('n', '<A-0>', ':BufferLast<CR>', opts)
-- Close buffer
map('n', '<C-w>', ':BufferClose<CR>', opts)
-- Snippets
nmap('<leader>os', ':VsnipOpen<CR>', opts)
-- Rspec
nmap('<leader>rf', ':TestFile<CR>', opts)
nmap('<leader>rs', ':TestNearest<CR>', opts)
nmap('<leader>rl', ':TestLast<CR>', opts)
nmap('<leader>ra', ':TestSuite<CR>', opts)
nmap('<leader>rg', ':TestVisit<CR>', opts)


-- ------------------------------------------------------
-- Global Settings
-- ------------------------------------------------------
-- [[ Context ]]
opt.showmode = true
opt.number = true
opt.relativenumber = true        -- bool: Show relative line numbers
opt.colorcolumn = "+1"
opt.clipboard = "unnamed"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.list = false
opt.foldnestmax = 10
opt.signcolumn = "yes"
opt.foldenable = false
opt.cursorline = true

-- [[ Filetypes ]]
opt.encoding = "utf8"            -- str:  String encoding to use
opt.fileencoding = "utf8"        -- str:  File encoding to use

-- [[ Theme ]]
opt.syntax = "ON"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable

-- [[ Search ]]
opt.ignorecase = true            -- bool: Ignore case in search patterns
opt.smartcase = true             -- bool: Override ignorecase if search contains capitals
opt.incsearch = true             -- bool: Use incremental search
opt.hlsearch = false             -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true             -- bool: Use spaces instead of tabs
opt.shiftwidth = 2               -- num:  Size of an indent
opt.softtabstop = 2              -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 2                  -- num:  Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true            -- bool: Place new window to right of current one
opt.splitbelow = true            -- bool: Place new window below the current one

-- [[ Buffer ]]
local indent = 2
opt.expandtab = true
opt.fileformat = 'unix'
opt.softtabstop = indent
opt.spelllang = 'en'
opt.swapfile = false
opt.shiftwidth = indent
opt.tabstop = indent
opt.undofile = false


-- ------------------------------------------------------
-- Plugins management via Packer
-- ------------------------------------------------------
require("plugins")
require("plugins.nvim-tree")
require("plugins.nvim-treesitter")
require("plugins.lsp_config")
require("plugins.telescope")
require("plugins.floaterm")
require("plugins.gitsigns")
require("plugins.indentline")
require("nvim-web-devicons").get_icons()
require("nvim_comment").setup()
require("plugins.nvim-cmp")
require("nvim-lsp-installer").setup {}
require("nvim-ts-autotag").setup({
  filetypes = { "html", "erb", "javascript", "javascriptreact", "typescriptreact", "vue" },
})
require("nvim-treesitter.configs").setup {
    endwise = {
        enable = true,
    },
}
require("lualine").setup {
  sections = {
    lualine_c = {
      {
        'filename',
        file_status = true,      -- Displays file status (readonly status, modified status)
        path = 1,                -- 0: Just the filename
      }
    }
  }
}
-- nvim-ts-rainbow
require("nvim-treesitter.configs").setup {
  highlight = {
      -- ...
  },
  -- ...
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
cmd [[colorscheme codedark]]
