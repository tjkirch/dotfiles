# Defined in /tmp/fish.nobGtc/__fish_cancel_commandline.fish @ line 2
function __fish_cancel_commandline
    # Close the pager if it's open (#4298)
    commandline -f cancel

    set -l cmd (commandline)
    if test -n "$cmd"
        commandline -C 1000000
        if set -q fish_color_cancel
            echo -ns (set_color $fish_color_cancel) "^C" (set_color normal)
        else
            echo -ns "^C"
        end
        if command -sq tput
            # Clear to EOL (to erase any autosuggestion).
            echo -n (tput el; or tput ce)
        end
        for i in (seq (commandline -L))
            echo ""
        end
        commandline ""
        # From faho: lets you keep ^C command lines with multiline prompts.
        # https://github.com/fish-shell/fish-shell/issues/3537#issuecomment-477550193
        # Shouldn't need this in fish 3.2+?
        # https://github.com/fish-shell/fish-shell/commit/eb35975c0fdd7420608aa743882c0fc96f3bf585
        commandline -f execute
        emit fish_cancel
    end
    # Repaint even if we haven't cancelled anything,
    # so the prompt refreshes and the terminal scrolls to it.
    commandline -f repaint
end
