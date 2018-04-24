let mapleader = ","
let maplocalleader = ","

" Easier buffer/file navigation, thanks Gary
" Open files with <leader>f
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
" Open files, limited to the directory of the current file, with <leader>gf
map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>
cnoremap %% <C-R>=expand('%:h').'/'<cr>
nnoremap <leader><leader> <c-^>

map <leader>cd :cd %:p:h<CR>

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

" Easy mapping to highlight pasted text
" http://vim.wikia.com/wiki/Selecting_your_pasted_text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Magic regexes
nnoremap / /\v
nnoremap ? ?\v

" Never save and quit on accident
nnoremap ZZ zz

" Search, but not in comments...  (not perfect)
nnoremap <Leader>/ /\v((^\|\s)#.*)@<!

" place.vim - insert text without moving cursor
nmap <Leader>a <Plug>(place-insert)
nmap <Leader>b <Plug>(place-insert-multiple)

nmap <Leader>r :RainbowLevelsToggle<CR>
