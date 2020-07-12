# Defined in - @ line 1
function off --wraps='sudo poweroff' --description 'alias off=sudo poweroff'
  sudo poweroff $argv;
end
