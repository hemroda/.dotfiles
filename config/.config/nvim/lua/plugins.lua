local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return require("packer").startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Theme
    use "tomasiser/vim-code-dark"
    use "kyazdani42/nvim-web-devicons"
    use {"romgrk/barbar.nvim", requires = {"kyazdani42/nvim-web-devicons"}}
    use {"nvim-lualine/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons", opt = true}}
    -- For nice highlighting
    use "nvim-treesitter/nvim-treesitter"
    -- File explorer
    use {"kyazdani42/nvim-tree.lua", requires = {"kyazdani42/nvim-web-devicons",}}
    -- For indent line
    use "lukas-reineke/indent-blankline.nvim"
    
    -- Searching files and in them easily
    use {"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"}}

    -- Tools
    use "voldikss/vim-floaterm"
    use "terrortylor/nvim-comment"
    use {"p00f/nvim-ts-rainbow", after = "nvim-treesitter"}
    -- Auto pairs "", "", [], {}, (), ``
    use "windwp/nvim-autopairs"
    -- use {"windwp/nvim-ts-autotag", event = "InsertEnter", after = "nvim-treesitter"}
    use "windwp/nvim-ts-autotag"
    -- Provide git info
    use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}
    
    -- Collection of configurations for the built-in LSP client
    use "neovim/nvim-lspconfig" 
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
