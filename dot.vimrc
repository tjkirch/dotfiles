set nocompatible

filetype off
call pathogen#runtime_append_all_bundles('bundle')
call pathogen#runtime_append_all_bundles('colors')
call pathogen#helptags()
filetype plugin indent on

" Indentation holy war
"set autoindent
set cindent
set cinoptions=l1,m1,j1
set diffopt=filler,iwhite
set expandtab
set shiftwidth=3
"set smartindent
set smarttab
set tabstop=3

set autochdir
set hidden
set hlsearch
set incsearch
set modeline
set nostartofline
set relativenumber
set ruler
set showcmd
set showmatch
set title
set visualbell

set backspace=indent,eol,start
set backupdir=~/.vim_bak,/var/tmp,/tmp
set cpoptions-=aABces
set directory=~/.vim_bak,/var/tmp,/tmp
set history=1000
set laststatus=2
set matchtime=0
set numberwidth=1
set report=0
set scrolloff=3
set sidescroll=1
set sidescrolloff=3
set shortmess=at
set wildmode=list:longest

set statusline=%f
set statusline+=\ [%{strlen(&ft)?&ft:'noft'}\ %{&fileformat}\ %{&encoding}]
set statusline+=\ %h%w%m%r
set statusline+=\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=\ %{exists('g:loaded_rvm')?rvm#statusline_ft_ruby():''}
set statusline+=\ %{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
set statusline+=\ %=
set statusline+=%-19.(%c%V\ :\ %l/%L%)
set statusline+=\ %P

set grepprg=ack
set grepformat=%f:%l:%m

let mapleader = ","
let maplocalleader = ","

runtime macros/matchit.vim

nnoremap ' `
nnoremap ` '
nnoremap / /\v
nnoremap ? ?\v
nnoremap ZZ zz

function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" Easier buffer/file navigation
map <leader>cd :cd %:p:h<CR>
nmap <silent> <Leader>n :NERDTreeToggle<CR>
nmap <silent> <Leader>t :TlistToggle<CR>

" Easier window management
map <c-h> <c-w>h
map <c-l> <c-w>l
map <c-j> <c-w>j
map <c-k> <c-w>k
"map <c-+> <c-w>+  " how to do these?
"map <c--> <c-w>-
"map <c->> <c-w>>
"map <c-<> <c-w><

syntax on

if has('gui_running')
   set guifont=Anonymous\ Pro\ 11

   " no menu bar
   set guioptions-=m

   " no toolbar
   set guioptions-=T

   " no scroll bars
   set guioptions-=L
   set guioptions-=r
else
   set t_Co=256
   let Tlist_Inc_Winwidth = 0
end

colorscheme lucius
