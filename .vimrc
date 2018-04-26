set nocompatible

filetype off

filetype plugin indent on
syntax on

" Run builtin matchit config
runtime macros/matchit.vim

" Run all personal configs
runtime! config/*.vim
