if [ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh

   for file in ${ZDOTDIR:-${HOME}}/.zim/custom/*.zsh; do
      [ -r "${file}" ] && . ${file}
   done
fi
