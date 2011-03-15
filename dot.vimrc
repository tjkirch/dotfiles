set nocompatible

filetype off

" Set up plugins through pathogen
call pathogen#runtime_append_all_bundles('bundle')
call pathogen#runtime_append_all_bundles('colors')
call pathogen#helptags()

filetype plugin indent on
syntax on

" Run builtin matchit config
runtime macros/matchit.vim

" Run all personal configs
runtime! config/*.vim
