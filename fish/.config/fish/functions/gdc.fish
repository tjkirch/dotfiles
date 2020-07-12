# Defined in - @ line 1
function gdc --wraps='git diff --cached' --description 'alias gdc=git diff --cached'
  git diff --cached $argv;
end
