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
   nnoremap <buffer><silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
   nnoremap <buffer><silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<cr>

   " Show diagnostic popup on cursor hover
   autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})

   " Enable type inlay hints
   """FIXME use this for diagnostics too?  changing file means diagnostics on wrong line
   autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
   \ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }
endfunction

function! SetLspOptionsRust()
   " Highlight current term on cursor hover
   autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
   autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
   autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
endfunction

" completion and nvim-lspconfig setup:
lua <<EOF
-- Set up nvim-cmp.
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.config.disable,
    ['<C-f>'] = cmp.config.disable,
    ['<C-Space>'] = cmp.config.disable,
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.config.disable,
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }
  )
})
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Set up lspconfig.
local lspconfig = require'lspconfig'
lspconfig.rust_analyzer.setup({ on_attach=on_attach, capabilities=capabilities })
lspconfig.diagnosticls.setup{
   on_attach=on_attach,
   capabilities=capabilities,
   filetypes = { "sh", "toml" },
   init_options = {
      filetypes = {
         sh = "shellcheck",
         toml = "tomll"
      },
      linters = {
         shellcheck = {
            sourceName = "shellcheck",
            command = "shellcheck",
            args = { "--format=gcc", "-" },
            formatPattern = {
               "^[^:]+:(\\d+):(\\d+):\\s+([^:]+):\\s+(.*)$",
               {
                  line = 1,
                  column = 2,
                  message = {4},
                  security = 3
               }
            },
            securities = {
               error = "error",
               warning = "warning",
               note = "info"
            },
         },
         tomll = {
            sourceName = "tomll",
            command = "tomll",
            isStdout = false,
            isStderr = true,
            args = { },
            formatPattern = {
               "^\\((\\d+), (\\d+)\\): (.*)$",
               {
                  line = 1,
                  column = 2,
                  message = {3},
               }
            }
         }
      }
   }
}
EOF
