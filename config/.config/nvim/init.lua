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
require("plugins.nvim-cmp")
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
require("nvim-ts-autotag").setup({
  filetypes = { "html", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

vim.cmd [[colorscheme codedark]]
