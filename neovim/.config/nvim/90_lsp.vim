" Set general and language-specific LSP options
augroup lsp
   autocmd!
   autocmd FileType rust,sh,toml call SetLspOptions()
   autocmd FileType rust call SetLspOptionsRust()
augroup END

function! SetLspOptions()
   " LSP-based code navigation
   nnoremap <buffer><silent> <leader>la <cmd>lua vim.lsp.buf.code_action()<CR>
   nnoremap <buffer><silent> <leader>ld <cmd>lua vim.lsp.buf.definition()<CR>
   nnoremap <buffer><silent> <leader>lD :vsp<CR><cmd>lua vim.lsp.buf.definition()<CR>
   nnoremap <buffer><silent> <leader>li <cmd>lua vim.lsp.buf.implementation()<CR>
   nnoremap <buffer><silent> <leader>lr <cmd>lua vim.lsp.buf.references()<CR>
   nnoremap <buffer><silent> <leader>lR <cmd>lua vim.lsp.buf.rename()<CR>
   nnoremap <buffer><silent> <leader>ls <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
   nnoremap <buffer><silent> <leader>lt <cmd>lua vim.lsp.buf.type_definition()<CR>
   nnoremap <buffer><silent> K          <cmd>lua vim.lsp.buf.hover()<CR>

   " Goto previous/next diagnostic warning/error
   nnoremap <buffer><silent> g[ <cmd>lua vim.diagnostic.goto_prev()<cr>
   nnoremap <buffer><silent> g] <cmd>lua vim.diagnostic.goto_next()<cr>

   " Show diagnostic popups - errors, warnings, clippy, etc.
   set signcolumn=yes
   autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
endfunction

function! SetLspOptionsRust()
   " Move items (functions, etc.) up or down
   nnoremap <buffer><silent> <leader>l<Up> :RustMoveItemUp<CR>
   nnoremap <buffer><silent> <leader>l<Down> :RustMoveItemDown<CR>

   " Highlight current term on cursor hover
   autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
   autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
   autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
endfunction

lua <<EOF
-- LSP Diagnostics setup
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = {
       severity = { min = vim.diagnostic.severity.INFO },
    },
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})
EOF
