local cmd = vim.cmd

require('global-settings')
require('keymaps')

-- ------------------------------------------------------
-- Plugins management via Packer
-- ------------------------------------------------------
require("plugins")
require('plugins.nvim-tree')
require('plugins.telescope')
require('plugins.nvim-treesitter')
require('plugins.nvim-cmp')
require('plugins.startify')
require('plugins.lsp-config')
require('plugins.floaterm')
require('nvim_comment').setup()
require('lualine').setup()

vim.cmd [[colorscheme codedark]]