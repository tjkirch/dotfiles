# Defined in - @ line 1
function xshow --wraps='xbps-query -RS' --description 'alias xshow=xbps-query -RS'
  xbps-query -RS $argv;
end
