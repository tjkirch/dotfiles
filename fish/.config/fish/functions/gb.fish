# Defined in - @ line 1
function gb --wraps='git branch -va' --description 'alias gb=git branch -va'
  git branch -va $argv;
end
