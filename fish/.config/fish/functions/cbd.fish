# Defined in - @ line 1
function cbd --wraps='cargo build' --description 'alias cbd=cargo build'
  cargo build $argv;
end
