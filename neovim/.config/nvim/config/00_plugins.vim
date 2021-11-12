call plug#begin('~/.local/share/nvim/plugged')
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'whiteinge/diffconflicts'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-lua/plenary.nvim'  " for diffview
Plug 'tpope/vim-endwise'
Plug 'dag/vim-fish'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
Plug 'reedes/vim-litecorrect'
Plug 'simnalamburt/vim-mundo'
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
Plug 'tpope/vim-unimpaired'
Plug 'alcesleo/vim-uppercase-sql', { 'for': 'sql' }
Plug 'tpope/vim-vinegar'
Plug 'wesQ3/vim-windowswap'
Plug 'sindrets/winshift.nvim'

" color schemes
Plug 'nanotech/jellybeans.vim'

" LSP setup taken from https://sharksforarms.dev/posts/neovim-rust/ - thanks!
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
" Extentions to built-in LSP, for example, providing type inlay hints
Plug 'tjdevries/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
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
