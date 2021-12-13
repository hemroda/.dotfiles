
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ','			                                      " Setting leader key to comma
nmap <leader>sv :source ~/.config/nvim/init.vim<CR>
nmap <leader>ev :tabedit ~/.config/nvim/init.vim<CR>		      " Open vimrc file in new buffer for quick edit
nmap <leader>b :Buffers<CR>
nmap <leader>q :q<CR>
nmap <leader>s :w<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pluggins & their configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'tomasiser/vim-code-dark'
  Plug 'tpope/vim-commentary'
  Plug 'airblade/vim-gitgutter'
  source ~/.config/nvim/plugins/vim-maximizer.vim
  source ~/.config/nvim/plugins/floaterm.vim
  source ~/.config/nvim/plugins/fzf.vim
  source ~/.config/nvim/plugins/vim-fugitive.vim
  source ~/.config/nvim/plugins/statusline.vim
  source ~/.config/nvim/plugins/netrw.vim
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set termguicolors
set background=dark
colorscheme codedark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set number
set relativenumber
set cursorline                                                " Enable highlighting of the current line
set autoread                    		                          " Reload files changed outside vim
set autowriteall  					                                  " Automatically write the file when switching buffers
set updatetime=100
set completeopt=menuone,noinsert,noselect
set mouse=a
set diffopt+=vertical
set hidden
set cmdheight=1

" ===================== Show whitespaces ======================
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" ==================== Split management =======================
" Where to put new splits
set splitright
set splitbelow

" How to navigate between the splits
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" Split Opening Commands
nnoremap <leader>hs :split<space>
nnoremap <leader>vs :vsplit<space>

" ====================== Indentation =========================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab                                                 " Expand tabs to spaces

filetype plugin on
filetype indent on

set list listchars=tab:\ \ ,trail:·		                        " Display tabs and trailing spaces visually
set linebreak    				                                      " Wrap lines at convenient points

" Indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" ========================= Search ============================
set incsearch       				                                  " Find the next match as we type the search
set hlsearch        				                                  " Highlight searches by default
set ignorecase    			                                      " Ignore case when searching...
set smartcase       				                                  " ...unless we type a capital
nmap <leader><space> :nohlsearch<cr>		                      " Add simple highlight removal after search.


" =================== Turn Off Swap Files ====================
set noswapfile
set nobackup
set nowb

