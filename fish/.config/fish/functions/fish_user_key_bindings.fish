# Defined in /tmp/fish.J3VStT/fish_user_key_bindings.fish @ line 2
function fish_user_key_bindings
    # Load fzf key bindings: ctrl-r history, ctrl-t file finder, alt-c cd
    fzf --fish | source

   # ctrl+backspace to delete previous word; ctrl+w is dirty
   bind -M insert \cH backward-kill-word

   # paste should go after current character
   bind -M default p forward-char yank backward-char
end
