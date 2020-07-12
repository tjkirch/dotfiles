# Defined in - @ line 1
function gls --wraps='git log --stat' --description 'alias gls=git log --stat'
  git log --stat $argv;
end
