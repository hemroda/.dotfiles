print('File: nvim/lua/plugins.lua')

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use "terrortylor/nvim-comment"
end)  