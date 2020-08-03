# Defined in /tmp/fish.Ir4hdw/fish_user_key_bindings.fish @ line 1
function fish_user_key_bindings
   # Load fzf key bindings from local/Mac/Linux paths
   for path in "$HOME/local/src/fzf/shell/key-bindings.fish" \
               "/usr/local/opt/fzf/shell/key-bindings.fish" \
               "/usr/share/doc/fzf/key-bindings.fish"
      if test -r $path
         source $path
         fzf_key_bindings
         break
      end
   end

   # ctrl+backspace to delete previous word; ctrl+w is dirty
   bind -M insert \cH backward-kill-word

   # ctrl+c should abort, but leave the command visible for later reuse
   for mode in (bind -L)
      bind -M $mode \cc 'echo -e \n(set_color -io -b black black)interrupted(set_color normal)\n\n; commandline ""; commandline -f repaint'
   end
end
