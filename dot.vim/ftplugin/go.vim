setlocal noexpandtab

" Automatically format Go files after save, letting you see the changes
autocmd BufWritePost *.go :silent Fmt
