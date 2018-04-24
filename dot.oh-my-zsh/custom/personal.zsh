[ -r .ssh/environment-$(hostname) ] && source .ssh/environment-$(hostname) && echo

fortune -as

export EDITOR="vim"
set -o vi
bindkey -v
export KEYTIMEOUT=10

# Default to incremental search
bindkey '^r' history-incremental-search-backward

source "/home/local/ANT/tjk/local/src/fzf/shell/key-bindings.zsh"

setopt nobeep extendedglob

# No screen flow control
stty -ixon
