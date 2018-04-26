if has('win32') || has('win64')
   let $BACKUPDIR=$VIM."\vimfiles\backup"
   set backupdir=$BACKUPDIR,$TEMP,.
   set directory=$BACKUPDIR,$TEMP,.
   set undodir=$BACKUPDIR,$TEMP,.

   set shell=cmd

   if has('gui_running')
      set guifont=Anonymous_Pro:h11
   endif

   vmap <C-c> "*y

   " Fix diff on Windows
   set diffexpr=MyDiff()
   function MyDiff()
     let opt = '-a --binary '
     if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
     if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
     let arg1 = v:fname_in
     if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
     let arg2 = v:fname_new
     if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
     let arg3 = v:fname_out
     if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
     let eq = ''
     if $VIMRUNTIME =~ ' '
       if &sh =~ '\<cmd'
         let cmd = '""' . $VIMRUNTIME . '\diff"'
         let eq = '"'
       else
         let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
       endif
     else
       let cmd = $VIMRUNTIME . '\diff'
     endif

     silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
   endfunction
endif
