syntax on
set laststatus=0
set number
set guicursor=
set cursorline 
set scrolloff=7
set hlsearch
set incsearch
set ignorecase
set smartcase
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set autoindent
set cindent

noremap // :noh<CR>
noremap <TAB> %
inoremap {<CR> {<CR>}<ESC>k$A<CR>
nnoremap <F9> :w <bar> :! g++ % -std=c++11 -O2 -Wall && ./a.out < inp<CR>

autocmd BufNewFile a.cpp 0r /home/voidz/Documents/kode/stuff/Template.cpp

"call plug#begin('~/.config/nvim/plugged')
"Plug 'mcchrish/zenbones.nvim'
"call plug#end()

set termguicolors
colorscheme OceanicNext
