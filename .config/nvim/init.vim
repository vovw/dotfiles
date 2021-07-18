call plug#begin('~/.vim/plugged')
    Plug 'voidz7/nita.vim'
    Plug 'voidz7/rita.vim'
call plug#end()

colorscheme rita

inoremap jk <Esc>
nnoremap <C-Tab> :tabn<CR>

set nobackup nowritebackup noswapfile   " No backup file , No swap file
set cursorline            " gives a cursorline
set expandtab             " Use spaces instead of tabs.
set smarttab              " Be smart using tabs ;)
set shiftwidth=4          " One tab == four spaces.
set tabstop=4             " One tab == four spaces.
set hlsearch              " Don't highlight after search
set smartcase             " Ignore case when only lower case is typed
set incsearch             " Highlight live while searching
set scrolloff=10          " Scroll screen when cursor is 10 lines away
