# Defined in - @ line 1
function xfiles --wraps='xbps-query -f' --description 'alias xfiles=xbps-query -f'
  xbps-query -f $argv;
end
