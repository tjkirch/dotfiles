# Defined in - @ line 1
function yl --wraps='yum list' --description 'alias yl=yum list'
  yum list $argv;
end
