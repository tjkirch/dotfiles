# Defined in - @ line 1
function grc --wraps='git rebase --continue' --description 'alias grc=git rebase --continue'
  git rebase --continue $argv;
end
