# Defined in - @ line 1
function gl --wraps='git log' --description 'alias gl=git log'
  git log $argv;
end
