print('File: nvim/lua/plugins.lua')

return require('packer').startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use "tomasiser/vim-code-dark"
    use 'tomasr/molokai'
    
    use "terrortylor/nvim-comment"
    use "kyazdani42/nvim-web-devicons"
    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use {
      "nvim-telescope/telescope.nvim",
      requires = { {"nvim-lua/plenary.nvim"} }
    }
    use "nvim-treesitter/nvim-treesitter"
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
end)  
