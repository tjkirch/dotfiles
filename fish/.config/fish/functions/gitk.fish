# Defined in - @ line 1
function gitk --wraps='gitk --all 2>/dev/null &' --description 'alias gitk=gitk --all 2>/dev/null &'
 command gitk --all 2>/dev/null & $argv;
end
