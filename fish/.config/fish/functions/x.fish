# Defined in - @ line 1
function x --wraps='exec startx -- vt(fgconsole)' --description 'alias x=exec startx -- vt(fgconsole)'
  exec startx -- vt(fgconsole) $argv;
end
