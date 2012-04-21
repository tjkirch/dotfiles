let mapleader = ","
let maplocalleader = ","

" Easier buffer/file navigation
map <leader>cd :cd %:p:h<CR>
nmap <silent> <Leader>n :NERDTreeToggle<CR>
nmap <silent> <Leader>t :TlistToggle<CR>

" Git - Fugitive/Extradite mappings
nmap <Leader>ge :Gedit<Space>
nmap <Leader>gs :Gsplit<Space>
nmap <Leader>gv :Gvsplit<Space>
nmap <Leader>gd :Gdiff<Space>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gc :Gcommit<Space>
nmap <Leader>gm :Gmove<Space>
nmap <Leader>gg :Ggrep<Space>
nmap <Leader>gl :Glog<CR>
nmap <Leader>gr :Gread<Space>
nmap <Leader>gw :Gwrite<Space>
nmap <Leader>e :Extradite<CR>

" Easier window management
map <c-h> <c-w>h
map <c-l> <c-w>l
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-Up>    <c-w>+
map <c-Down>  <c-w>-
map <c-Right> <c-w>>
map <c-Left>  <c-w><

" Assume we want to keep our place by default
nnoremap ' `
nnoremap ` '

" Magic regexes
nnoremap / /\v
nnoremap ? ?\v

" Never save and quit on accident
nnoremap ZZ zz

" Quick way to hide highlighted searches
nnoremap <CR> :nohlsearch<CR>

" Search, but not in comments...  (not perfect)
nnoremap <Leader>/ /\v((^\|\s)#.*)@<!
