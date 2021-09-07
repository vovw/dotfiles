call plug#begin('~/.config/nvim/plugged/')
Plug 'preservim/nerdcommenter'
Plug 'sainnhe/gruvbox-material'
call plug#end()

set termguicolors
colorscheme gruvbox-material

set mouse=a
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

let mapleader=" "
inoremap jk <Esc>
map <Tab> :noh<CR>
map <leader>n :Vex<CR>
nnoremap <leader>b :buffers<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprev<CR>

filetype plugin on
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
