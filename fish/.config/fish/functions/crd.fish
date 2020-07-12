# Defined in - @ line 1
function crd --wraps='cargo run' --description 'alias crd=cargo run'
  cargo run $argv;
end
