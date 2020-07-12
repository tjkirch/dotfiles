# Defined in - @ line 1
function ls --wraps='ls --color=auto' --description 'alias ls=ls --color=auto'
 command ls --color=auto $argv;
end
