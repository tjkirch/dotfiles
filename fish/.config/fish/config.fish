# Load ssh-agent setup, if configured
test -r $HOME/.ssh/environment-$hostname.fish && source $HOME/.ssh/environment-$hostname.fish

source $HOME/.config/fish/abbr.fish

# (event functions cannot be autoloaded, must be defined here)
function _report_time -d "Reports runtime of long commands" --on-event fish_postexec
    if test "$CMD_DURATION" -gt 5000
        set milliseconds (math -s0 "($CMD_DURATION) % 1000")
        set seconds (math -s0 "($CMD_DURATION / (1000)) % 60")
        set minutes (math -s0 "($CMD_DURATION / (1000*60)) % 60")
        set hours (math -s0 "($CMD_DURATION / (1000*60*60)) % 24")
        set days (math -s0 "($CMD_DURATION / (1000*60*60*24))")

        echo -n (set_color -io -b black black)"Took "
        test $days -gt 0 && echo -n "$days days, "
        test $hours -gt 0 && echo -n "$hours hours, "
        test $minutes -gt 0 && echo -n "$minutes minutes, "
        printf "%d.%03d seconds: %s" $seconds $milliseconds $argv[1]
        echo (set_color normal)
    end
end
