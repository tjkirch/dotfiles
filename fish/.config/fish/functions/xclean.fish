# Defined in - @ line 1
function xclean --wraps='sudo xbps-remove -O' --description 'alias xclean=sudo xbps-remove -O'
  sudo xbps-remove -O $argv;
end
