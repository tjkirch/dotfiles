# Defined in - @ line 1
function as --wraps='aptitude search' --description 'alias as=aptitude search'
  aptitude search $argv;
end
