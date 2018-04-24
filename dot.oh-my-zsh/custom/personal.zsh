[ -r .ssh/environment-$(hostname) ] && source .ssh/environment-$(hostname) && echo

fortune -as

export EDITOR="vim"
set -o vi
bindkey -v

# Default to incremental search
bindkey '\e/' history-incremental-pattern-search-backward
bindkey '^n' history-incremental-pattern-search-backward
bindkey '^p' history-incremental-pattern-search-backward
bindkey '\e?' vi-history-search-backward

setopt nobeep extendedglob

# No screen flow control
stty -ixon
