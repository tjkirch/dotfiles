# Defined in - @ line 1
function ais --wraps='aptitude install -s' --description 'alias ais=aptitude install -s'
  aptitude install -s $argv;
end
