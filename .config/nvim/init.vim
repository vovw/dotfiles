call plug#begin('~/.vim/plugged')
    Plug 'tomasr/molokai'
    "Plug 'voidz7/nita.vim'
    Plug '~/code/nita.vim'
call plug#end()

colorscheme molokai

set nobackup nowritebackup noswapfile   " No backup file , No swap file
set cursorline            "gives a cursorline

set expandtab             " Use spaces instead of tabs.
set smarttab              " Be smart using tabs ;)
set shiftwidth=4          " One tab == four spaces.
set tabstop=4             " One tab == four spaces.

set nohlsearch            " Don't highlight after search
set incsearch             " Highlight live while searching
set scrolloff=10          " Scroll screen when cursor is 10 lines away
