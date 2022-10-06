call plug#begin('~/.local/share/nvim/plugged')
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'whiteinge/diffconflicts'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-endwise'
Plug 'dag/vim-fish'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
Plug 'phaazon/hop.nvim'
Plug 'reedes/vim-litecorrect'
Plug 'simnalamburt/vim-mundo'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'junkblocker/patchreview-vim'
Plug 'vim-scripts/python_match.vim', { 'for': 'python' }
Plug 'mechatroner/rainbow_csv', { 'for': 'csv' }
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'zirrostig/vim-schlepp'
Plug 'inside/vim-search-pulse'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-swap'
Plug 'tomtom/tcomment_vim'
Plug 'cespare/vim-toml'
Plug 'p00f/nvim-ts-rainbow'
Plug 'tpope/vim-unimpaired'
Plug 'alcesleo/vim-uppercase-sql', { 'for': 'sql' }
Plug 'tpope/vim-vinegar'
Plug 'wesQ3/vim-windowswap'
Plug 'sindrets/winshift.nvim'

" color schemes
Plug 'nanotech/jellybeans.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Autocompletion framework for built-in LSP
Plug 'hrsh7th/nvim-cmp'
" Completion from LSP
Plug 'hrsh7th/cmp-nvim-lsp'
" Other completion sources
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
call plug#end()

" Leader key for mappings
let mapleader = ","
let maplocalleader = ","

" Easier to find cursor after searching
let g:vim_search_pulse_mode = 'pattern'

" [fzf Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Move visually selected text around with arrows
vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight

" git blame
let g:git_messenger_no_default_mappings = v:true
nmap <Leader>gb :GitMessenger<CR>

" fzf
nnoremap <leader><leader> :Buffers<CR>
nnoremap <leader><space> :GFiles<CR>
nnoremap <leader>fb :BCommits<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fr :Rg! <C-R><C-W><CR>
nnoremap <leader>fw :Windows<CR>

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
