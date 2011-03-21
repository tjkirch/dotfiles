set statusline=%f
set statusline+=\ %h%w%m%r%<
set statusline+=\ [%{strlen(&ft)?&ft:'noft'}\ %{&fileformat}\ %{&encoding}]
set statusline+=\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=\ %{exists('g:loaded_rvm')?rvm#statusline_ft_ruby():''}
set statusline+=\ %{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
set statusline+=\ %=
set statusline+=%-19.(%c%V\ :\ %l/%L%)
set statusline+=\ %P
