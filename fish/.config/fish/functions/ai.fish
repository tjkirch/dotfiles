# Defined in - @ line 1
function ai --wraps='sudo aptitude install' --description 'alias ai=sudo aptitude install'
  sudo aptitude install $argv;
end
