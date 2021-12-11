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
end
