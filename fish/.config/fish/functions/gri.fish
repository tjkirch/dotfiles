# Defined in - @ line 1
function gri --wraps='git rebase -i' --description 'alias gri=git rebase -i'
  git rebase -i $argv;
end
