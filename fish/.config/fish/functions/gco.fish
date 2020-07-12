# Defined in - @ line 1
function gco --wraps='git checkout' --description 'alias gco=git checkout'
  git checkout $argv;
end
