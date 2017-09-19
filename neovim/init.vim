"NeoBundle Scripts-----------------------------

if has('vim_starting')
  " Required:
  set runtimepath+=/Users/brinon/.config/nvim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/brinon/.config/nvim/bundle'))

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
"


syntax on
syntax enable

set number
set pastetoggle=<F3>

"NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '.*DS_Score.*']

"TEMP
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
"inoremap <esc>   <NOP>

":inoremap jk <Esc>
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


" Inca linting
let s:inca_root = '/Users/brinon/crowdAI/inca'

" enable and configure pylint linter
if executable('pylint')
  let g:neomake_python_pylint_maker = neomake#makers#ft#python#pylint()
  let g:neomake_python_pylint_maker.args += ['--rcfile='.s:inca_root.'/pylintrc']
  let g:neomake_python_enabled_makers = ['pylint']
else
  echohl ErrorMsg
  echomsg "[CROWDAI] You don't have pylint installed! You won't be able to see linting errors!"
  echomsg "[CROWDAI] Please run `pip install --upgrade future pylint`"
  echohl Normal
endif

" enable and configure autoformatter
" INFO: to auto-format, run :Neoformat in your python buffer
if executable('yapf')
  let g:neoformat_python_yapf = neoformat#formatters#python#yapf()
  let g:neoformat_python_yapf.args = ['--style='.s:inca_root.'/style.yapf']
  let g:neoformat_enabled_python = ['yapf']
else
  echohl ErrorMsg
  echomsg "[CROWDAI] You don't have yapf installed! You won't be able to auto-format your Python code!"
  echomsg "[CROWDAI] Please run `pip install --upgrade yapf`"
  echohl Normal
endif

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

