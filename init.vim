" general settings 
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


" maps
nnoremap ; :!
nnoremap <SPACE> <Nop>
let mapleader=" "
inoremap {<CR> {<CR>}<ESC>k$A<CR> 
nnoremap <F9> :w <bar> :! g++ % -std=c++11 -O2 -Wall && ./a.out < inp<CR>


" auto commands
autocmd BufRead,BufNewFile *.porth set filetype=porth
autocmd BufNewFile a.cpp 0r /home/voidz/Documents/kode/stuff/Template.cpp 


" theme
set termguicolors 
colorscheme zenflesh 


" nerdtree but its dumb and inbuild
filetype plugin on
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_banner=0
map <leader>n :Lex<CR> 


" auto complete plugins if required 
"call plug#begin('~/.config/nvim/plugged') 
"Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
"Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
"call plug#end() 
