"NeoBundle Scripts-----------------------------
"



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
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'Raimondi/delimitMate' 
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'ludovicchabant/vim-gutentags'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'psf/black'



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

set path+=**

set number
set pastetoggle=<F3>

colorscheme gruvbox


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
"nnoremap <Esc> <NOP>

:inoremap jj <Esc>
:inoremap JJ <Esc>


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

nnoremap <C-T> :tabnew<cr>

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
set foldlevel=80
set colorcolumn=80


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
set tabstop=4
set shiftwidth=4
set expandtab


let b:delimitMate_autoclose = 1 



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
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_server_python_interpreter = 'python3.9'
let g:ycm_global_ycm_extra_conf = "/Users/pllueca/.ycm_extra_conf.py"

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
com! Fmt :Black
