colorscheme jellybeans

set breakindent
set cindent
set cinoptions=l1,m1,j1
set completeopt=menuone,noinsert,noselect
set cpoptions-=aABces
set cursorline
set diffopt=internal,filler,closeoff,vertical
set expandtab
set hidden
set inccommand=split
set list
set listchars=tab:»·,trail:·,nbsp:·,extends:↲,precedes:↳
set matchtime=0
set modeline
set numberwidth=1
set relativenumber
set report=0
set scrollback=100000
set scrolloff=3
set shiftwidth=3
set shortmess=cfilmnorxFOT
set showbreak=↘
set showmatch
set sidescrolloff=3
set switchbuf=useopen
set tabstop=3
set title
set undofile
set updatetime=500
set visualbell
set wildignorecase
set wildmode=list:longest
set winwidth=83

if executable('rg')
   set grepprg=rg\ --no-heading\ --vimgrep
   set grepformat=%f:%l:%c:%m
endif

" Status line:
" filename up to 50 chars; break left (lose path rather than metadata)
set statusline=%<%.50f
" help, preview, modified, and read-only flags
set statusline+=\ %h%w%m%r
" filetype (if set), fileformat, and encoding
set statusline+=\ [%{strlen(&ft)?&ft:'noft'}\ %{&fileformat}\ %{&encoding}]
" fugitive status line, if available
set statusline+=\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}
" rvm status line, if available
set statusline+=\ %{exists('g:loaded_rvm')?rvm#statusline():''}
" syntastic status line, if available
set statusline+=\ %{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
" separate left-aligned from right-aligned bits
set statusline+=\ %=
" line count out of total, and physical/virtual column number
set statusline+=%-19.(%l/%L\ :\ %c%V%)
" percentage through file
set statusline+=\ %P
