zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*:*:*:*:*' menu no no-select
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true

setopt auto_list
setopt no_bash_auto_list
setopt no_auto_menu
setopt no_menu_complete
unsetopt cdable_vars

fpath=(~/.oh-my-zsh/custom/completion ${fpath})
