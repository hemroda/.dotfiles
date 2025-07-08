-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Enable line highlighting
vim.opt.cursorline = true

-- Show hybrid line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Add some padding around the cursor
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate",
      config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = { "rust", "lua", "vim", "bash", "python" },
            highlight = { enable = true },
            indent = { enable = true },
          }
      end
    },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require('lualine').setup {
          options = {
            theme = 'auto',
            section_separators = '',
            component_separators = ''
          }
        }
      end
    },
    {
      "catppuccin/nvim", name = "catppuccin", priority = 1000,
      config = function()
        vim.cmd.colorscheme "catppuccin"
      end
    },
    {
      "nvim-telescope/telescope.nvim",
      -- It's good practice to list direct dependencies
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        -- The require call is now inside the config function
        local builtin = require('telescope.builtin')
        
        -- Your keymaps are now here
        vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope: Find Files' })
        vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope: Live Grep' })
        vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope: List Buffers' })
        vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope: Help Tags' })
      end
    },


    -- add your plugins here
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
