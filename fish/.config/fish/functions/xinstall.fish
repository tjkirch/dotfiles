# Defined in - @ line 1
function xinstall --wraps='sudo xbps-install -S' --description 'alias xinstall=sudo xbps-install -S'
  sudo xbps-install -S $argv;
end
