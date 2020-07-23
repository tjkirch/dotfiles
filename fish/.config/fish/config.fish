# Load ssh-agent setup, if configured
test -r .ssh/environment-$hostname.fish && source .ssh/environment-$hostname.fish

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
      set milliseconds (math -s0 "($CMD_DURATION) % 1000")
      set seconds      (math -s0 "($CMD_DURATION / (1000)) % 60")
      set minutes      (math -s0 "($CMD_DURATION / (1000*60)) % 60")
      set hours        (math -s0 "($CMD_DURATION / (1000*60*60)) % 24")
      set days         (math -s0 "($CMD_DURATION / (1000*60*60*24))")

      echo -n (set_color -io -b black black)"Took "
      test $days -gt 0 && echo -n "$days days, "
      test $hours -gt 0 && echo -n "$hours hours, "
      test $minutes -gt 0 && echo -n "$minutes minutes, "
      printf "%d.%03d seconds: %s" $seconds $milliseconds $argv[1]
      echo (set_color normal)
   end
end
