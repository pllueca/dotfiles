set nocompatible

syntax on
syntax enable
set number

filetype plugin on

filetype plugin indent on
set autoindent

set path+=**

:inoremap jj <Esc>
:inoremap JJ <Esc>

"nnoremap <Esc> <NOP>

" map ; to : and viceversa
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :
set colorcolumn=100
set mouse=a
set wildignore=*.swp,*.pyc,*.bak,*png,*tif

"move between buffers/splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-T> :tabnew<cr>

set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
function! SetupPython()
  setlocal softtabstop=2
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal expandtab
endfunction
autocmd Filetype python call SetupPython()


"
"use system clipboard
set clipboard=unnamed

" Backups
set backupdir=/tmp//,.
set directory=/tmp//,.
if v:version >= 703
  set undodir=/tmp//,.
endif

" custom functions and shit
com! FormatJSON %!python -m json.tool
