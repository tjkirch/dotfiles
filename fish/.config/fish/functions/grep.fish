# Defined in - @ line 1
function grep --wraps='grep --color=auto' --description 'alias grep=grep --color=auto'
 command grep --color=auto $argv;
end
