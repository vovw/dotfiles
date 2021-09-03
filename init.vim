" plugs
call plug#begin('~/.vim/plugged/')
Plug 'ap/vim-css-color'
Plug 'sainnhe/gruvbox-material'
Plug 'voidz7/nita.vim/'
Plug 'preservim/nerdtree'
call plug#end()

" colors
set termguicolors
colorscheme gruvbox-material

" settings
set hidden
set noruler
set cursorline 
set scrolloff=7
set hlsearch
set incsearch
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set guicursor=


" plugin settings

" maps
inoremap jk <Esc>
