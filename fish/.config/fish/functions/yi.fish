# Defined in - @ line 1
function yi --wraps='sudo yum install' --description 'alias yi=sudo yum install'
  sudo yum install $argv;
end
