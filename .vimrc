set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
filetype plugin indent on

map <F2> :NERDTreeToggle<CR>

set number
set copyindent
set hlsearch
set incsearch

set visualbell
set noerrorbells
set title


set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

set nobackup
set noswapfile

syntax on
filetype indent plugin on
