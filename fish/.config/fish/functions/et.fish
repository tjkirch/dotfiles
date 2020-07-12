# Defined in - @ line 1
function et --wraps='exa -l --time-style=iso --git-ignore --tree -I target' --description 'alias et=exa -l --time-style=iso --git-ignore --tree -I target'
  exa -l --time-style=iso --git-ignore --tree -I target $argv;
end
