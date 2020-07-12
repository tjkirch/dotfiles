# Defined in - @ line 1
function ggh --wraps='git glog | head' --description 'alias ggh=git glog | head'
  git glog | head $argv;
end
