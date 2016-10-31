set nu
set ts=4
set expandtab
set sw=4
set bs=2
set bg=dark
set incsearch
set paste
set wildmode=longest,list   " change filename autocomplete to be more like bash
set mouse=v                 " some vim defaults to mouse=a, which sucks for copying and pasting in Xorg
syntax on
filetype on             " enable file type detection
filetype plugin on      " enable file type plugins
filetype indent on      " enable file type indents

colorscheme solarized

" for per-directory vimrc files
" see: https://jezenthomas.com/how-i-write-invoices-in-vim/
set exrc " Enable use of directory-specific .vimrc
set secure " Only run autocommands owned by me

" from: https://github.com/jfrazelle/.vim/blob/master/vimrc
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8

set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set nocompatible
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters

" speed up syntax highlighting
set nocursorcolumn
set nocursorline
