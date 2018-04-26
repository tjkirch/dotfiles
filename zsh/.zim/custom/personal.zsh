[ -r .ssh/environment-$(hostname) ] && source .ssh/environment-$(hostname) && echo

fortune -s

export EDITOR="vim"
set -o vi
bindkey -v
export KEYTIMEOUT=10

# Default to incremental search
bindkey '^r' history-incremental-search-backward

[ -r "${HOME}/local/src/fzf/shell/key-bindings.zsh" ] \
&& . "${HOME}/local/src/fzf/shell/key-bindings.zsh"

HISTFILE="${ZDOTDIR:-${HOME}}/.zsh_history"
export HISTSIZE=11000000
export SAVEHIST=10000000
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

setopt AUTO_PUSHD
setopt AUTO_RESUME
setopt BG_NICE
setopt CHECK_JOBS
setopt EXTENDEDGLOB
setopt HUP
setopt LONG_LIST_JOBS
setopt MULTIOS
setopt NOBEEP
setopt NOTIFY

# No screen flow control
stty -ixon
