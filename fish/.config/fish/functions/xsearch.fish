# Defined in - @ line 1
function xsearch --wraps='xbps-query -Rs' --description 'alias xsearch=xbps-query -Rs'
  xbps-query -Rs $argv;
end
