# Defined in - @ line 1
function gs --wraps='git status' --description 'alias gs=git status'
  git status $argv;
end
