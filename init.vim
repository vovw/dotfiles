call plug#begin('~/.vim/plugged')
    Plug 'ap/vim-css-color'
    Plug 'sainnhe/gruvbox-material'
call plug#end()

set termguicolors
colorscheme gruvbox-material

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
