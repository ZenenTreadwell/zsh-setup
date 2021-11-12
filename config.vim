" Vim Config File, built by Zen - November 2021

" Vundle Setup
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'dense-analysis/ale'
Plugin 'sheerun/vim-polyglot'
call vundle#end()

filetype plugin indent on

" ALE Setup
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'javascript': ['prettier', 'eslint']
            \}
let g:ale_fix_on_save = 1

" QoL improvements
syntax enable
set re=0 "Old regex engine is no good for TS files
set ai
set laststatus=2
set relativenumber
set formatoptions+=j " delete comments when joining lines

set expandtab           "Spaces over tabs, always and
set shiftwidth=4        "fourever
set shiftround

" Cursor Motion
set matchpairs+=<:>
set backspace=indent,eol,start
set scrolloff=5 " Keeps lines below cursor while scrolling

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Mouse Scrolling for superior experience
set mouse=a

" Remaps
:inoremap jj <Esc> " Speedy Escaping of insert mode
