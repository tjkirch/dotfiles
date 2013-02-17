fortune -as

set -o vi
export EDITOR="vim"

setopt nobeep extendedglob

# No screen flow control
stty -ixon
