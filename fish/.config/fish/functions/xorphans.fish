# Defined in - @ line 1
function xorphans --wraps='sudo xbps-remove -o' --description 'alias xorphans=sudo xbps-remove -o'
  sudo xbps-remove -o $argv;
end
