return require('packer').startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use "nvim-treesitter/nvim-treesitter"
    -- Themes
    use "tomasiser/vim-code-dark"
    use 'tomasr/molokai'
    use "kyazdani42/nvim-web-devicons"
    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    -- Searches
    use {
      "nvim-telescope/telescope.nvim",
      requires = {"nvim-lua/plenary.nvim"} 
    }
    -- Tools
    use "terrortylor/nvim-comment"
    use {
      "goolord/alpha-nvim",
      requires = {"kyazdani42/nvim-web-devicons"}
    }
    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    -- Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
end)
