# Defined in - @ line 1
function gc --wraps='git commit -v' --description 'alias gc=git commit -v'
  git commit -v $argv;
end
