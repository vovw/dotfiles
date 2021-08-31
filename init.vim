call plug#begin('~/.vim/plugged/')
Plug 'ap/vim-css-color'
Plug 'sainnhe/gruvbox-material'
Plug 'itchyny/lightline.vim'
call plug#end()

inoremap jk <Esc>

set termguicolors
colorscheme gruvbox-material

set hidden
set noruler
set cursorline 
set scrolloff=7
set showtabline=2

set hlsearch
set incsearch
set ignorecase
set smartcase

set tabstop=4
set shiftwidth=4
set expandtab
set guicursor=

let g:lightline = {'colorscheme' : 'gruvbox_material'}
