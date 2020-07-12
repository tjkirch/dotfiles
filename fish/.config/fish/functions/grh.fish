# Defined in - @ line 1
function grh --wraps='git reset HEAD' --description 'alias grh=git reset HEAD'
  git reset HEAD $argv;
end
