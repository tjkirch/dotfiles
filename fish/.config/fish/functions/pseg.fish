# Defined in - @ line 1
function pseg --wraps='ps -ef | grep' --description 'alias pseg=ps -ef | grep'
  ps -ef | grep $argv;
end
