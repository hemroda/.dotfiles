return require('packer').startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- For nice highlighting
    use "nvim-treesitter/nvim-treesitter"
    -- Themes
    use "tomasiser/vim-code-dark"
    use 'tomasr/molokai'
    use "kyazdani42/nvim-web-devicons"
    use {"nvim-lualine/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons", opt = true}}
    -- For indent line
    use 'lukas-reineke/indent-blankline.nvim'
    -- Searching files and in them easily
    use {"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"}}
    -- File explorer
    use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons',}}
    -- Tools
    use "terrortylor/nvim-comment"
    use {"goolord/alpha-nvim", requires = {"kyazdani42/nvim-web-devicons"}}
    use 'voldikss/vim-floaterm'
    -- Provide git info
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use {'p00f/nvim-ts-rainbow', after = "nvim-treesitter"}
    -- use {'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter"}
    use 'windwp/nvim-ts-autotag'
    -- Auto pairs '', "", [], {}, (), ``
    use 'windwp/nvim-autopairs'
    -- Collection of configurations for built-in LSP client
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'
    -- For buffer completion
    use 'hrsh7th/cmp-buffer'
    -- For path completion
    use 'hrsh7th/cmp-path'
    -- Autocompletion plugin
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-cmdline'
end)
