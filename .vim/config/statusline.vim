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
