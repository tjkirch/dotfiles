" Set general and language-specific LSP options
augroup lsp
   autocmd!
   "TODO: guard LSP with capability checks, not by language; see :h lsp-defaults
   autocmd FileType rust,sh,toml,lua call SetLspOptions()
   autocmd FileType rust call SetLspOptionsRust()
augroup END

lua <<EOF
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        -- Enable inlay hints whenever possible
        if client.server_capabilities.inlayHintProvider then
           vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
        -- other LSP config to go here
    end
})
EOF

function! SetLspOptions()
   lua <<EOF
   -- LSP-based code navigation
   vim.keymap.set('n', '<leader>la', function() vim.cmd.RustLsp('codeAction') end, {silent=true, buffer=true, desc='code actions'})
   vim.keymap.set('n', '<leader>ld', function() vim.lsp.buf.definition() end, {silent=true, buffer=true, desc='go to definition'})
   vim.keymap.set('n', '<leader>lD', ':vsp<CR><cmd>lua vim.lsp.buf.definition()<CR>', {silent=true, buffer=true, desc='open definition in vsplit'})
   vim.keymap.set('n', '<leader>li', function() vim.lsp.buf.implementation() end, {silent=true, buffer=true, desc='go to implementation'})
   vim.keymap.set('n', '<leader>lr', function() vim.lsp.buf.references() end, {silent=true, buffer=true, desc='find references'})
   vim.keymap.set('n', '<leader>lR', function() vim.lsp.buf.rename() end, {silent=true, buffer=true, desc='rename symbol'})
   vim.keymap.set('n', '<leader>ls', function() vim.lsp.buf.workspace_symbol() end, {silent=true, buffer=true, desc='workspace symbols'})
   vim.keymap.set('n', '<leader>lt', function() vim.lsp.buf.type_definition() end, {silent=true, buffer=true, desc='go to type definition'})
EOF

   " Show diagnostic popups - errors, warnings, clippy, etc.
   set signcolumn=yes
   autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
endfunction

function! SetLspOptionsRust()
   lua <<EOF
   -- Move items (functions, etc.) up or down
   vim.keymap.set('n', '<leader>l<Up>',   ':RustLsp moveItem up<CR>', {silent=true, buffer=true, desc='move item up'})
   vim.keymap.set('n', '<leader>l<Down>', ':RustLsp moveItem down<CR>', {silent=true, buffer=true, desc='move item down'})
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
