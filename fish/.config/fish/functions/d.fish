# Defined in /tmp/fish.8Vtrc1/d.fish @ line 1
function d --wraps='cdargs "$argv" && cd (cat "$HOME/.cdargsresult")' --description 'alias d cdargs "$argv" && cd (cat "$HOME/.cdargsresult")'
  cdargs "$argv" && cd (cat "$HOME/.cdargsresult")
end
