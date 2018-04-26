if executable('rg')
   set grepprg=rg\ --no-heading\ --vimgrep
   set grepformat=%f:%l:%c:%m
endif
