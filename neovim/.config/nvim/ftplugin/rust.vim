compiler! cargo

" rustfmt automatically; I usually forget...
autocmd BufWritePre *.rs lua vim.lsp.buf.format({async=false, timeout_ms=1000})
