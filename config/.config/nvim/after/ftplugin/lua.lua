-- Little help for lua to be able to navigate to a file listed in a require('path')
-- Which allow to use gf to get to the file and <C-o> to go back
vim.opt_local.suffixesadd:prepend('.lua')
vim.opt_local.suffixesadd:prepend('init.lua')
vim.opt_local.path:prepend(vim.fn.stdpath('config')..'/lua')