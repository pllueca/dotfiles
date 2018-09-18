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
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'neomake/neomake'
NeoBundle 'sbdchd/neoformat'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'aykamko/vim-python-pep8-indent'
NeoBundle 'Raimondi/delimitMate' 
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'ervandew/supertab'
NeoBundle 'zah/nim.vim'
NeoBundle 'kassio/neoterm'
NeoBundle 'ludovicchabant/vim-gutentags'

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

"TEMP, L2vim
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
"inoremap <esc> <NOP>

:inoremap jj <Esc>
:inoremap JJ <Esc>

"nnoremap <Esc> <NOP>

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


" code folding
set foldmethod=indent
set foldlevel=99

"open nerdtree when vim is run w/out args
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"easymotion coloring
"hi link EasyMotionTarget ErrorMsg
"hi link EasyMotionShade  Comment
"hi link EasyMotionTarget2First ErrorMsg
"hi link EasyMotionTarget2Second Search


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

let b:delimitMate_autoclose = 1 


" nim
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
"nn <M-g> :call JumpToDef()<cr>
"ino <M-g> <esc>:call JumpToDef()<cr>i

" lightline
let g:lightline = { 'colorscheme': 'wombat' } 

" indent guides
"
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>

" ctags in ctrlP
nnoremap <c-[> :CtrlPTag<cr>

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
com! Fmt Neoformat

"Crowdai specific
source ~/.config/nvim/crowdai.vim
