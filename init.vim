call plug#begin('~/.vim/plugged')
    Plug 'ap/vim-css-color'
    Plug 'voidz7/rita.vim' "mountain-vim fork but minimal 
call plug#end()

colorscheme rita

set noruler
set cursorline 
set showtabline=2
set hlsearch
set incsearch
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=7
set laststatus=0

inoremap jj <Esc>
noremap <leader>n :set invnumber invrelativenumber <CR>

