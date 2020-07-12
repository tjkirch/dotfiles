# Defined in - @ line 1
function ct --wraps='cargo test' --description 'alias ct=cargo test'
  cargo test $argv;
end
