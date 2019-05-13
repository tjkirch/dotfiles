if has('gui_running')
   set guifont=DejaVu\ Sans\ Mono\ 9

   " no menu bar
   set guioptions-=m

   " no toolbar
   set guioptions-=T

   " no scroll bars
   set guioptions-=L
   set guioptions-=r
else
   let Tlist_Inc_Winwidth = 0
end

colorscheme jellybeans

"""set mouse=a
"""set ttymouse=urxvt
