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
