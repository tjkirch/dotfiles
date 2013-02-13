" plain text  (ignoring help files)
autocmd BufNewFile,BufRead *.txt if &ft != 'help' | setlocal ft=text | endif
