call plug#begin('~/.vim/plugged')
    Plug 'ap/vim-css-color'
    Plug 'voidz7/rita.vim' 
    Plug 'thepogsupreme/mountain.nvim'
call plug#end()

colorscheme mountain

inoremap jk <Esc>

set noruler
set cursorline 
set hlsearch
set incsearch
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=7
