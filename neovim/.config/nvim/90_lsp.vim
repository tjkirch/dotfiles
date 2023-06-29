" Set general and language-specific LSP options
augroup lsp
   autocmd!
   autocmd FileType rust,sh,toml,lua call SetLspOptions()
   autocmd FileType rust call SetLspOptionsRust()
augroup END

function! SetLspOptions()
   lua <<EOF
   -- LSP-based code navigation
   vim.keymap.set('n', '<leader>la', function() vim.lsp.buf.code_action() end, {silent=true, buffer=true, desc='code actions'})
   vim.keymap.set('n', '<leader>ld', function() vim.lsp.buf.definition() end, {silent=true, buffer=true, desc='go to definition'})
   vim.keymap.set('n', '<leader>lD', ':vsp<CR><cmd>lua vim.lsp.buf.definition()<CR>', {silent=true, buffer=true, desc='open definition in vsplit'})
   vim.keymap.set('n', '<leader>li', function() vim.lsp.buf.implementation() end, {silent=true, buffer=true, desc='go to implementation'})
   vim.keymap.set('n', '<leader>lr', function() vim.lsp.buf.references() end, {silent=true, buffer=true, desc='find references'})
   vim.keymap.set('n', '<leader>lR', function() vim.lsp.buf.rename() end, {silent=true, buffer=true, desc='rename symbol'})
   vim.keymap.set('n', '<leader>ls', function() vim.lsp.buf.workspace_symbol() end, {silent=true, buffer=true, desc='workspace symbols'})
   vim.keymap.set('n', '<leader>lt', function() vim.lsp.buf.type_definition() end, {silent=true, buffer=true, desc='go to type definition'})
   vim.keymap.set('n', 'K',          function() vim.lsp.buf.hover() end, {silent=true, buffer=true, desc='show hover info'})

   -- Goto previous/next diagnostic warning/error
   vim.keymap.set('n', 'g[', function() vim.diagnostic.goto_prev() end, {silent=true, buffer=true, desc='go to previous diagnostic'})
   vim.keymap.set('n', 'g]', function() vim.diagnostic.goto_next() end, {silent=true, buffer=true, desc='go to next diagnostic'})
EOF

   " Show diagnostic popups - errors, warnings, clippy, etc.
   set signcolumn=yes
   autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
endfunction

function! SetLspOptionsRust()
   lua <<EOF
   -- Move items (functions, etc.) up or down
   vim.keymap.set('n', '<leader>l<Up>',   '<cmd>RustMoveItemUp<CR>', {silent=true, buffer=true, desc='move item up'})
   vim.keymap.set('n', '<leader>l<Down>', '<cmd>RustMoveItemDown<CR>', {silent=true, buffer=true, desc='move item down'})
EOF

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
