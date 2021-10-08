
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/autoload/plugged')
  " Theme
  Plug 'morhetz/gruvbox'
  Plug 'lifepillar/vim-gruvbox8'
  Plug 'tomasiser/vim-code-dark'
  Plug 'bluz71/vim-nightfly-guicolors'
  Plug 'vim-airline/vim-airline'
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'Yggdroot/indentLine'

  " Search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-scripts/AutoComplPop'
  Plug 'majutsushi/tagbar'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Ruby
  Plug 'tpope/vim-endwise'
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'

  " CoffeeScript
  Plug 'kchmck/vim-coffee-script'

  " Syntax highlighting/styling/helper
  Plug 'dense-analysis/ale'

  " Searching
  Plug 'preservim/nerdtree'

  " Helpful tools
  Plug 'tpope/vim-commentary'
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-surround'
call plug#end()

