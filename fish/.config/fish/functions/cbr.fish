# Defined in - @ line 1
function cbr --wraps='cargo build --release' --description 'alias cbr=cargo build --release'
  cargo build --release $argv;
end
