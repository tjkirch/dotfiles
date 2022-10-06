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
   nnoremap <buffer><silent> <leader>lf <cmd>lua vim.lsp.buf.formatting()<CR>
   nnoremap <buffer><silent> <leader>lh <cmd>lua vim.lsp.buf.document_highlight()<CR>
   nnoremap <buffer><silent> <leader>lH <cmd>lua vim.lsp.buf.clear_references()<CR>
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
   " Highlight current term on cursor hover
   autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
   autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
   autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
   hi LspReferenceRead cterm=bold ctermbg=237 guibg=#45403d
   hi LspReferenceText cterm=bold ctermbg=237 guibg=#45403d
   hi LspReferenceWrite cterm=bold ctermbg=237 guibg=#45403d

   " Move items (functions, etc.) up or down
   nnoremap <buffer><silent> <leader>l<Up> :RustMoveItemUp<CR>
   nnoremap <buffer><silent> <leader>l<Down> :RustMoveItemDown<CR>

   " Rust-specific quick navigation
   nnoremap <buffer><silent> <leader>lc :RustOpenCargo<CR>
   nnoremap <buffer><silent> <leader>lp :RustParentModule<CR>
   nnoremap <buffer><silent> <leader>lg :RustViewCrateGraph<CR>
endfunction

" Snippet navigation, e.g. to jump between function params
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Rust helper (it does the rust_analyzer lspconfig setup on its own)
lua <<EOF
require("rust-tools").setup({ server = { settings = {
   ["rust-analyzer"] = { checkOnSave = { command = "clippy" }}
}}})

-- LSP Diagnostics setup
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

-- Completion plugin setup
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  -- Mappings for controlling the completion popup
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  -- Where to get completion options
  sources = {
    { name = 'nvim_lsp' },                -- from language server
    { name = 'nvim_lsp_signature_help'},  -- display function signatures with current parameter emphasized
    { name = 'vsnip' },                   -- nvim-cmp source for vim-vsnip
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
})

require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Set up null-ls to run non-LSP linters
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.formatting.taplo,
    },
})
EOF
