# Defined in - @ line 1
function susp --wraps='sudo pm-suspend --auto-quirks' --description 'alias susp=sudo pm-suspend --auto-quirks'
  sudo pm-suspend --auto-quirks $argv;
end
