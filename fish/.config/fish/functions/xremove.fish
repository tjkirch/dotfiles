# Defined in - @ line 1
function xremove --wraps='sudo xbps-remove -R' --description 'alias xremove=sudo xbps-remove -R'
  sudo xbps-remove -R $argv;
end
