function! DetectJson()
   if getline(1) == '{'
     setfiletype json
   endif
endfunction

augroup filetypedetect
  au BufRead,BufNewFile * call DetectJson()
augroup END
