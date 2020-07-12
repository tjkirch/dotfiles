# Defined in - @ line 1
function gsb --wraps='git show-branch -a' --description 'alias gsb=git show-branch -a'
  git show-branch -a $argv;
end
