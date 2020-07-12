# Defined in - @ line 1
function duh --wraps='du -h --max-depth=1' --description 'alias duh=du -h --max-depth=1'
  du -h --max-depth=1 $argv;
end
