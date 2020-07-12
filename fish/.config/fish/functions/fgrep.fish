# Defined in - @ line 1
function fgrep --wraps='fgrep --color=auto' --description 'alias fgrep=fgrep --color=auto'
 command fgrep --color=auto $argv;
end
