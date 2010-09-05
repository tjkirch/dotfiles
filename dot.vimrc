set nocompatible

" Indentation holy war
set shiftwidth=3
set tabstop=3
set expandtab
set smarttab
"set autoindent
"set smartindent
set cindent
set cinoptions=l1,m1,j1
set diffopt=filler,iwhite

set hidden
set hlsearch
set incsearch
set ruler
set showcmd
set showmatch
set title
set visualbell

set modeline
set backspace=indent,eol,start
set backupdir=~/.vim_bak,/var/tmp,/tmp
set directory=~/.vim_bak,/var/tmp,/tmp
set history=1000
set matchtime=0
set scrolloff=3
set shortmess=at
set wildmode=list:longest

set grepprg=ack
set grepformat=%f:%l:%m

let mapleader = ","
let maplocalleader = ","

syntax on
filetype plugin indent on

autocmd FileType make,python set noexpandtab

runtime macros/matchit.vim

nnoremap ' `
nnoremap ` '
nnoremap / /\v
nnoremap ? ?\v

" Easier buffer/file navigation
map <leader>cd :cd %:p:h<CR>
"nmap <silent> <Leader>x :BufferExplorer<CR>
"nmap <silent> <Leader>e :FilesystemExplorer<CR>
"nmap <silent> <Leader>r :FilesystemExplorerFromHere<CR>
"nmap <silent> <Leader>g :LustyJuggler<CR>
"nmap <silent> <TAB> :JugglePrevious<CR>
nmap <silent> <Leader>n :NERDTree<CR>
nmap <silent> <Leader>t :TlistToggle<CR>
"nmap <silent> <Leader>f :FuzzyFinderTextMate<CR>
"nmap <silent> <Leader>b :FuzzyFinderBuffer<CR>

" Easier window management
map <c-h> <c-w>h
map <c-l> <c-w>l
map <c-j> <c-w>j
map <c-k> <c-w>k
"map <c-+> <c-w>+  " how to do these?
"map <c--> <c-w>-
"map <c->> <c-w>>
"map <c-<> <c-w><

if has('gui_running')
	set guifont=Anonymous\ Pro\ 11
	set guioptions-=T
	set guioptions-=m
   set number
	colorscheme inkpot
else
	colorscheme desert
   let Tlist_Inc_Winwidth = 0
end

" Easy scratch buffer - thanks Jamis
function! ToggleScratch()
   if expand('%') == g:ScratchBufferName
      quit
   else
      Sscratch
   endif
endfunction

map <leader>sc :call ToggleScratch()<CR>

" Clojure stuff
"let clj_want_gorilla = 1
let clj_highlight_builtins = 1
let clj_highlight_contrib = 1
let clj_paren_rainbow = 1
"let vimclojure#NailgunClient = "/home/tjkirch/local/bin/ng"
