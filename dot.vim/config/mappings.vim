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

" Magic regexes
nnoremap / /\v
nnoremap ? ?\v

" Never save and quit on accident
nnoremap ZZ zz

" Quick way to hide highlighted searches
nnoremap <CR> :nohlsearch<CR>

" Search, but not in comments...  (not perfect)
nnoremap <Leader>/ /\v((^\|\s)#.*)@<!

" Easily run tests, thanks Gary
function! RunTests(filename)
" Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction

function! SetTestFile()
" Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

" Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

" Run this file
map <leader>t :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>T :call RunNearestTest()<cr>
" Run all test files
map <leader>a :call RunTests('')<cr>
