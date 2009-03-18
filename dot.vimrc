set nocompatible

" Indentation holy war
set shiftwidth=3
set expandtab

set hidden
set hlsearch
set incsearch
set ruler
set showcmd
set showmatch
set title
set visualbell

set backspace=indent,eol,start
set backupdir=~/.vim_bak,/var/tmp,/tmp
set directory=~/.vim_bak,/var/tmp,/tmp
set history=1000
set matchtime=0
set scrolloff=3
set shortmess=at
set wildmode=list:longest

let mapleader = ","
let maplocalleader = ","

syntax on
filetype plugin indent on

runtime macros/matchit.vim

nnoremap ' `
nnoremap ` '
nnoremap / /\v
nnoremap ? ?\v

"let g:LustyJugglerShowKeys = 2
"nmap <silent> <Leader>j :so ~/.vim/plugin/lusty-explorer.vim<CR>
nmap <silent> <Leader>f :FilesystemExplorer<CR>
nmap <silent> <Leader>b :BufferExplorer<CR>
nmap <silent> <Leader>r :FilesystemExplorerFromHere<CR>
nmap <silent> <Leader>g :LustyJuggler<CR>
nmap <silent> <TAB> :JugglePrevious<CR>

" Easier window/buffer switching
map <c-h> <c-w>h
map <c-l> <c-w>l
map <c-j> <c-w>j
map <c-k> <c-w>k

if has('gui_running')
	set guifont=Bitstream\ Vera\ Sans\ Mono\ 8
	set guioptions-=T
	set guioptions-=m
	colorscheme inkpot
else
	colorscheme desert
end

" Clojure stuff
let clj_want_gorilla = 1
let clj_highlight_builtins = 1
let clj_highlight_contrib = 1
let clj_paren_rainbow = 1
let vimclojure#NailgunClient = "~/bin/ng"
