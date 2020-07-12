# Defined in /tmp/fish.5tEPMM/fish_prompt.fish @ line 1
function fish_prompt --description 'tjk prompt'
   # Save the return status of the previous command
   set -l last_pipestatus $pipestatus
   # Show the return status(es) of the previous command
   set -l pipestatus_string (__fish_print_pipestatus \
      " [" "]" "|" \
      (set_color $fish_color_status) \
      (set_color --bold $fish_color_status) \
      $last_pipestatus)
   # Controls the level of detail from git in the prompt
   set -g __fish_git_prompt_show_informative_status true
   set -g __fish_git_prompt_showcolorhints true

   # The "\033[0K" clears to end of line before printing path, so quick changes with
   # alt+left and alt+right don't leave old path characters
   # https://github.com/fish-shell/fish-shell/issues/5860
   printf '[%s] %s%s%s%s@%s \033[0K%s%s%s%s%s\f\r> ' \
   (date "+%H:%M:%S") \
   \
   (test "$USER" = "root"; and set_color brred; or set_color brblue) \
   $USER \
   (set_color brblue) \
   (set -q SSH_TTY; and set_color brred; or set_color brblue) \
   (prompt_hostname) \
   \
   (set_color $fish_color_cwd) \
   $PWD \
   (fish_git_prompt) \
   $pipestatus_string \
   (set_color normal)
end
