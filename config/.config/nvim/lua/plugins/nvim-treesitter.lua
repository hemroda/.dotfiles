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