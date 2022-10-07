" Leader key for mappings
let mapleader = ","
let maplocalleader = ","

" Easier to find cursor after searching
let g:vim_search_pulse_mode = 'pattern'

" Move visually selected text around with arrows
vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight

" git blame
let g:git_messenger_no_default_mappings = v:true
nmap <Leader>gb :GitMessenger<CR>

" Telescope
nnoremap <leader><leader> <cmd>Telescope buffers<cr>
nnoremap <leader><space> <cmd>Telescope git_files<cr>
nnoremap <leader>tb <cmd>Telescope git_bcommits<cr>
nnoremap <leader>tc <cmd>Telescope git_commits<cr>
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tr <cmd>Telescope live_grep<cr>

" winshift
nnoremap <C-W><C-M> <Cmd>WinShift<CR>
nnoremap <C-W>m <Cmd>WinShift<CR>
nnoremap <C-W>s <Cmd>WinShift swap<CR>

" diffview
lua <<EOF
local cb = require'diffview.config'.diffview_callback
require'diffview'.setup {
  use_icons = false,
  signs = {
    fold_closed = "x",
    fold_open = "-",
  },
  default_args = {
    DiffviewOpen = { "--untracked-files=no" },
  },
}
EOF

" Treesitter plugin setup
lua <<EOF
require('nvim-treesitter.configs').setup {
   ensure_installed = { "bash", "fish", "rust", "toml" },
   auto_install = true,
   -- replace syntax highlighting / indentation with language-aware versions
   highlight = {
      enable = true,
      additional_vim_regex_highlighting=false,
   },
   indent = { enable = true },
   -- select text quickly based on language nodes/scopes
   incremental_selection = {
      enable = true,
      keymaps = {
         init_selection = '<CR>', scope_incremental = '<CR>',
         node_incremental = '<TAB>', node_decremental = '<S-TAB>',
      },
   },
   -- rainbow parens/brackets from nvim-ts-rainbow
   rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
   }
}
EOF

" Treesitter folding, where available
augroup treesitter
   autocmd!
   autocmd FileType bash,fish,rust,toml set foldmethod=expr
   autocmd FileType bash,fish,rust,toml set foldexpr=nvim_treesitter#foldexpr()
augroup END

" Hop, for quick movement
lua require'hop'.setup()
nnoremap `/ :HopPatternMW<CR>
nnoremap `a :HopAnywhereMW<CR>
nnoremap `c :HopChar1MW<CR>
nnoremap `l :HopLineMW<CR>
nnoremap `w :HopWordMW<CR>

" Store vsnip files with neovim
let g:vsnip_snippet_dir = stdpath("config") .. "/vsnip"

" Snippet navigation, e.g. to jump between function params
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

lua <<EOF
-- Telescope for finding files, LSP references, etc.
local telescope = require('telescope')
telescope.setup{}
-- Fast searching with native extension
telescope.load_extension('fzf')
-- This lets it take over vim.lsp.buf.* (except code actions; TODO)
telescope.load_extension('lsp_handlers')

-- Trouble for easy lists of code issues
require("trouble").setup{
    icons = false,
    fold_open = "v",
    fold_closed = ">",
    indent_lines = false,
    signs = {
        error = " err",
        warning = "warn",
        hint = "hint",
        information = "info",
        other = "  ->",
    },
    use_diagnostic_signs = false,
}
EOF
