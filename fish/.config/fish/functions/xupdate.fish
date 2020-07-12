# Defined in - @ line 1
function xupdate --wraps='sudo xbps-install -Su' --description 'alias xupdate=sudo xbps-install -Su'
  sudo xbps-install -Su $argv;
end
