compiler cargo

" rustfmt automatically; I usually forget...
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
