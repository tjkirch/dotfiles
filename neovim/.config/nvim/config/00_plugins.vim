call plug#begin('~/.local/share/nvim/plugged')
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'whiteinge/diffconflicts'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-endwise'
Plug 'dag/vim-fish'
Plug 'tpope/vim-fugitive'
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
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'gbrlsnchs/telescope-lsp-handlers.nvim'
Plug 'cespare/vim-toml'
Plug 'folke/trouble.nvim'
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
