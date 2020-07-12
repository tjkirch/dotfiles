# Defined in - @ line 1
function ll --wraps='ls -ahlF --color=auto' --description 'alias ll=ls -ahlF --color=auto'
  ls -ahlF --color=auto $argv;
end
