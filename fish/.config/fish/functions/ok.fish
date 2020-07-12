# Defined in - @ line 1
function ok --wraps='test "$status" -eq 0' --description 'alias ok=test "$status" -eq 0'
  test "$status" -eq 0 $argv;
end
