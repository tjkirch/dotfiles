# Defined in - @ line 1
function glp --wraps='git log -p' --description 'alias glp=git log -p'
  git log -p $argv;
end
