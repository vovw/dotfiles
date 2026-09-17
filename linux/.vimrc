" Lightweight Vim configuration. Leader = Space.
set nocompatible
let mapleader = ' '

" Disable unused bundled plugins. Keep netrw for directory browsing.
let g:loaded_gzip = 1
let g:loaded_zipPlugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_logiPat = 1
let g:loaded_manpager_plugin = 1
let g:loaded_rrhelper = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_2html_plugin = 1
let g:loaded_matchparen = 1

" Search recursively from the launch directory, even after switching files.
" Preserve the original root when this vimrc is sourced again.
let g:user_search_root = get(g:, 'user_search_root', getcwd())
set noautochdir
let &path = escape(g:user_search_root, ' ,\') . '/**'
let g:netrw_keepdir = 1

" Use existing plugins; never download anything during startup.
if filereadable(expand('~/.vim/autoload/plug.vim'))
  call plug#begin('~/.vim/plugged')
  Plug 'dense-analysis/ale', {'on': ['ALEEnable', 'ALEHover', 'ALEGoToDefinition', 'ALEFindReferences', '<Plug>(ale_previous_wrap)', '<Plug>(ale_next_wrap)']}
  Plug 'terryma/vim-expand-region'
  Plug 'tpope/vim-commentary'
  call plug#end()
endif
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 0

filetype plugin indent on
syntax enable
set background=dark
" Only enable true color when the terminal advertises it.
if has('termguicolors') && $COLORTERM =~# 'truecolor\|24bit'
  set termguicolors
endif
colorscheme habamax

" Paste via your terminal's paste shortcut. F2 is a manual fallback.
set nopaste
set pastetoggle=<F2>
set esckeys
if &term =~# 'xterm\|screen\|tmux\|rxvt\|kitty\|alacritty\|wezterm\|foot'
  let &t_BE = "\e[?2004h"
  let &t_BD = "\e[?2004l"
  let &t_PS = "\e[200~"
  let &t_PE = "\e[201~"
endif
" Let the terminal handle selecting/copying text with the mouse.
set mouse=
if has('clipboard')
  set clipboard^=unnamedplus
endif

set backspace=indent,eol,start
set autoindent
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set hidden
set number
set nowrap
set nocursorline
set nolist
set noshowmatch
set scrolloff=4 sidescrolloff=5
set signcolumn=auto
set laststatus=2
set statusline=%f\ %m%r%h%w%=%{&paste?'PASTE\ ':''}%y\ %l:%c\ %p%%
set showcmd showmode ruler
set incsearch hlsearch ignorecase smartcase
set wildmenu wildmode=longest:full,full
set wildignore+=*.pyc,*/__pycache__/*,*/node_modules/*,*/.git/*,*/.venv/*,*/venv/*
set completeopt=menuone,noselect
set ttimeout ttimeoutlen=30
set timeout timeoutlen=300
" Bound syntax highlighting work on very long lines.
set synmaxcol=200
set lazyredraw
set history=1000
set undolevels=1000
set updatetime=1000
set splitbelow splitright

" Keep recovery and persistent undo out of project directories.
let s:state = expand('~/.vim/state')
for s:dir in ['swap', 'backup', 'undo']
  call mkdir(s:state . '/' . s:dir, 'p', 0700)
endfor
let &directory = s:state . '/swap//'
let &backupdir = s:state . '/backup//'
let &undodir = s:state . '/undo//'
set swapfile writebackup nobackup undofile

augroup user_vimrc
  autocmd!
  autocmd VimResized * wincmd =
  " Do not automatically wrap text or insert comment leaders as you type.
  autocmd FileType * setlocal formatoptions-=t formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" Save, search, files, buffers, and terminal.
nnoremap <leader>w :write<CR>
nnoremap <silent> <leader><Space> :nohlsearch<CR>
nnoremap <silent> <leader>e :Lexplore<CR>
nnoremap <silent> <C-n> :Lexplore<CR>
nnoremap <silent> <leader>t :vertical terminal<CR>
nnoremap <silent> <C-s> :vertical terminal<CR>
nnoremap <leader>f :find<Space>
nnoremap <leader>b :ls<CR>:buffer<Space>
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
nnoremap <silent> <leader>l :setlocal list!<CR>
nnoremap <silent> <leader>r :setlocal relativenumber!<CR>
set listchars=tab:>-,trail:.,extends:>,precedes:<
tnoremap <Esc> <C-\><C-n>

" Preserve the yank register when replacing a visual selection.
xnoremap p "_dP
xnoremap < <gv
xnoremap > >gv
xnoremap <BS> <gv
xnoremap <Tab> >gv
" Restore standard visual-block Ctrl-V; expand/shrink with v / Shift-V.
xmap v <Plug>(expand_region_expand)
xmap V <Plug>(expand_region_shrink)

" Existing ALE shortcuts; linters must be explicitly configured to run.
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap <silent> <C-h> :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap <silent> gr :ALEFindReferences<CR>

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Fast mode bounds work for large files and bulk pastes. Undo stays available.
function! UserFastMode() abort
  setlocal syntax=OFF nospell nofoldenable foldmethod=manual
  setlocal norelativenumber nocursorline nocursorcolumn
  setlocal indentexpr= nosmartindent nocindent
  let b:ale_enabled = 0
  let b:user_fast_mode = 1
endfunction
function! UserMaybeFastMode() abort
  if !get(b:, 'user_fast_mode', 0) && (line('$') > 20000 || line2byte(line('$') + 1) > 1024 * 1024)
    call UserFastMode()
  endif
endfunction
command! FastMode call UserFastMode()
nnoremap <silent> <leader>F :FastMode<CR>
augroup user_vim_fast
  autocmd!
  autocmd BufReadPre * if getfsize(expand('<afile>')) > 1024 * 1024 | call UserFastMode() | endif
  autocmd BufReadPost,FileType * if get(b:, 'user_fast_mode', 0) | call UserFastMode() | else | call UserMaybeFastMode() | endif
  autocmd TextChanged,TextChangedI * call UserMaybeFastMode()
augroup END
