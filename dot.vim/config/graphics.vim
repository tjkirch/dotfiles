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
   set t_Co=256
   let Tlist_Inc_Winwidth = 0
end

colorscheme jellybeans
