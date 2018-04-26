

#
# User configuration sourced by interactive shells
#

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
if [[ -s ${ZIM_HOME}/init.zsh ]]; then
   source ${ZIM_HOME}/init.zsh

   for zimdotfile in ${ZIM_HOME}/custom/*.zsh; do
      [ -r "${zimdotfile}" ] && . ${zimdotfile}
   done
fi
