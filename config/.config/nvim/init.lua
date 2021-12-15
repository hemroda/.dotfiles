
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
require('plugins.autopairs')
require('plugins.gitsigns')
require('plugins.indentline')
require('nvim-web-devicons').get_icons()
require('nvim_comment').setup()
require('lualine').setup()
require('nvim-ts-autotag').setup({
  filetypes = { 'html', 'javascript', 'javascriptreact', 'typescriptreact', 'erb', 'vue' },
})

vim.cmd [[colorscheme codedark]]
