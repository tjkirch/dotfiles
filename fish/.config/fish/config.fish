# Load ssh-agent setup, if configured
test -r .ssh/environment-(hostname) && source .ssh/environment-(hostname) && echo

# I want sbin after bin, so not putting it in fish_user_paths
set -xa PATH "/usr/sbin" "/sbin"

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

# (event functions cannot be autoloaded, must be defined here)
function _report_time -d "Reports runtime of long commands" --on-event fish_postexec
   if test "$CMD_DURATION" -gt 5000
      echo (set_color -io -b black black)took $CMD_DURATION milliseconds: $argv[1](set_color normal)
   end
end
