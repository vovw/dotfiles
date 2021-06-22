call plug#begin('~/.vim/plugged')
call plug#end()

set clipboard+=unnamedplus
set nobackup noswapfile   " No backup file , No swap file

set expandtab             " Use spaces instead of tabs.
set smarttab              " Be smart using tabs ;)
set shiftwidth=4          " One tab == four spaces.
set tabstop=4             " One tab == four spaces.

set nohlsearch            " Don't highlight after search
set incsearch             " Highlight live while searching
set scrolloff=10          " Scroll screen when cursor is 10 lines away

"Status-line
set statusline=
set statusline+=%#IncSearch#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#CursorLineNr#
set statusline+=\ %F
set statusline+=%= 
set statusline+=%#Search#
set statusline+=\ %l/%L
set statusline+=\ [%c]
