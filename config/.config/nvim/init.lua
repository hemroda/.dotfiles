-- ------------------------------------------------------
-- Settings & Keymaps 
-- ------------------------------------------------------
require("global_settings")
require("keymaps")

-- ------------------------------------------------------
-- Plugins management via Packer
-- ------------------------------------------------------
require("plugins")
require("plugins.lsp_config")
require("plugins.telescope")
require("plugins.floaterm")
require("plugins.autopairs")
require("plugins.gitsigns")
require("plugins.nvim-tree")
require("plugins.nvim-treesitter")
require("plugins.indentline")
require("nvim-web-devicons").get_icons()
require("nvim_comment").setup()
require("lualine").setup()
require("nvim-ts-autotag").setup({
  filetypes = { "html", "javascript", "javascriptreact", "typescriptreact", "erb", "vue" },
})

vim.cmd [[colorscheme codedark]]
