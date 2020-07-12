# Defined in - @ line 1
function xrfiles --wraps='xbps-query -R -f' --description 'alias xrfiles=xbps-query -R -f'
  xbps-query -R -f $argv;
end
