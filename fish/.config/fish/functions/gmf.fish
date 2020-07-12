# Defined in - @ line 1
function gmf --wraps='git merge --ff-only' --description 'alias gmf=git merge --ff-only'
  git merge --ff-only $argv;
end
