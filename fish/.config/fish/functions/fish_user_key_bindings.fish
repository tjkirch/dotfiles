# Defined in /tmp/fish.J3VStT/fish_user_key_bindings.fish @ line 2
function fish_user_key_bindings
   # Load fzf key bindings from local/Mac/Linux paths
   for path in "$HOME/local/src/fzf/shell/key-bindings.fish" \
               "/usr/local/opt/fzf/shell/key-bindings.fish" \
               "/usr/share/doc/fzf/key-bindings.fish" \
               "/usr/share/fzf/key-bindings.fish"
      if test -r $path
         source $path
         fzf_key_bindings
         break
      end
   end

   # ctrl+backspace to delete previous word; ctrl+w is dirty
   bind -M insert \cH backward-kill-word

   # paste should go after current character
   bind -M default p forward-char yank backward-char

   # some bindings that won't be available until fish 3.2
   bind -s --preset -m insert c0 backward-kill-line repaint-mode
   bind -s --preset -m insert cf begin-selection forward-jump kill-selection end-selection repaint-mode
   bind -s --preset -m insert ct begin-selection forward-jump backward-char kill-selection end-selection repaint-mode
   bind -s --preset -m insert cF begin-selection backward-jump kill-selection end-selection repaint-mode
   bind -s --preset -m insert cT begin-selection backward-jump forward-single-char kill-selection end-selection repaint-mode
   bind -s --preset -m insert ch backward-char begin-selection kill-selection end-selection repaint-mode
   bind -s --preset -m insert cl begin-selection kill-selection end-selection repaint-mode
   bind -s --preset -m insert ci backward-jump-till and repeat-jump-reverse and begin-selection repeat-jump kill-selection end-selection repaint-mode
   bind -s --preset -m insert ca backward-jump and repeat-jump-reverse and begin-selection repeat-jump kill-selection end-selection repaint-mode
   bind -s --preset y0 backward-kill-line yank
   bind -s --preset yf begin-selection forward-jump kill-selection yank end-selection
   bind -s --preset yt begin-selection forward-jump-till kill-selection yank end-selection
   bind -s --preset yF begin-selection backward-jump kill-selection yank end-selection
   bind -s --preset yT begin-selection backward-jump-till kill-selection yank end-selection
   bind -s --preset yh backward-char begin-selection kill-selection yank end-selection
   bind -s --preset yl begin-selection kill-selection yank end-selection
   bind -s --preset yi backward-jump-till and repeat-jump-reverse and begin-selection repeat-jump kill-selection yank end-selection
   bind -s --preset ya backward-jump and repeat-jump-reverse and begin-selection repeat-jump kill-selection yank end-selection
end
