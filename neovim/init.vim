"NeoBundle Scripts-----------------------------
if has('vim_starting')
  " Required:
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.config/nvim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'wincent/command-t'
NeoBundle 'neomake/neomake'
NeoBundle 'sbdchd/neoformat'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'aykamko/vim-python-pep8-indent'
NeoBundle 'ervandew/supertab'
NeoBundle 'Raimondi/delimitMate' 
NeoBundle 'davidhalter/jedi-vim' 
NeoBundle 'tpope/vim-surround'
NeoBundle 'fatih/vim-go'


" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
"

syntax on
syntax enable

set number
set pastetoggle=<F3>

"NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '.DS_Store']

"TEMP
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
inoremap <esc>   <NOP>

:inoremap jj <Esc>

" map ; to : and viceversa
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

"move between buffers/splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
function! SetupPython()
  setlocal softtabstop=2
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal expandtab
endfunction
autocmd Filetype python call SetupPython()

" split panes
set splitright

"tab windwos
"nnoremap <C-l> gt
"nnoremap <C-h> gT

"fugitive git integration
set statusline=%<\ %f\ %{fugitive#statusline()}

"mouse support
set mouse=a

"more remaps
" <space> as leader
nnoremap <space> <Nop>
let mapleader=" "
"map <space> \
map <leader>w <leader><leader>w
map <leader>b <leader><leader>b

"open nerdtree when vim is run w/out args
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"easymotion coloring
"hi link EasyMotionTarget ErrorMsg
"hi link EasyMotionShade  Comment
"hi link EasyMotionTarget2First ErrorMsg
"hi link EasyMotionTarget2Second Search


" commant-t
set wildignore=*.swp,*.pyc,*.bak,*png,*tif

filetype plugin indent on
set autoindent

set colorcolumn=100

" configure hanging indent in Python to 4 spaces per Google's pylintrc, e.g.
" function_call(
"     arg1, arg2, arg3)
" ^^^^
let g:python_pep8_hanging_indent_width = 4

" automagically set indent to 2 for python
autocmd FileType python setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
" automagically run Neomake on save
autocmd! BufWritePost * Neomake

"jedi-vim
let g:jedi#auto_initialization = 0
let g:jedi#show_call_signatures = "1"
let b:delimitMate_autoclose = 1 

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

"Crowdai specific
source ~/.config/nvim/crowdai.vim
