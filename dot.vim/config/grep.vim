if has('win32unix')
   set grepprg=ack-grep
else
   set grepprg=ack
endif

set grepformat=%f:%l:%m
