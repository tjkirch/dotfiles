# Defined in - @ line 1
function xlist --wraps='xbps-query -l' --description 'alias xlist=xbps-query -l'
  xbps-query -l $argv;
end
