# Defined in - @ line 1
function gr --wraps='git rebase' --description 'alias gr=git rebase'
  git rebase $argv;
end
