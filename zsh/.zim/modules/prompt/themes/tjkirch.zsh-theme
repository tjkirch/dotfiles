# prompt style and colors based on Steve Losh's Prose theme:
# http://github.com/sjl/oh-my-zsh/blob/master/themes/prose.zsh-theme
#
# vcs_info modifications from Bart Trojanowski's zsh prompt:
# http://www.jukie.net/bart/blog/pimping-out-zsh-prompt
#
# git untracked files modification from Brian Carper:
# http://briancarper.net/blog/570/git-info-in-your-zsh-prompt

export VIRTUAL_ENV_DISABLE_PROMPT=1

virtualenv_info() {
  [ ${VIRTUAL_ENV} ] && print '('${fg[blue]}${VIRTUAL_ENV:t}%{${reset_color}%}') '
}

tjkirch_preexec() {
  case "$(history $HISTCMD)" in
    *git*)PR_GIT_UPDATE=1
          ;;
    *svn*)PR_GIT_UPDATE=1
          ;;
  esac
}

tjkirch_chpwd() {
  PR_GIT_UPDATE=1
}

prompt_tjkirch_precmd() {
  if [[ -n "$PR_GIT_UPDATE" ]] ; then
    # check for untracked files or updated submodules, since vcs_info doesn't
    if git ls-files --other --exclude-standard 2> /dev/null | grep -q "."; then
      PR_GIT_UPDATE=1
      FMT_BRANCH="(%{$turquoise%}%b%u%c %{$hotpink%}X${PR_RST})"
    else
      FMT_BRANCH="(%{$turquoise%}%b%u%c${PR_RST})"
    fi
    zstyle ':vcs_info:*:prompt:*' formats "${FMT_BRANCH} "

    vcs_info 'prompt'
  fi

  PROMPT='%(?, ,%{$red%}FAIL: $?${${reset_color}%}
)
%{$magenta%}%n${${reset_color}%}@%{$yellow%}%m${${reset_color}%}: %{$blue%}%~${${reset_color}%} $vcs_info_msg_0_$(virtualenv_info)%{${reset_color}%}
%(!.#.$) '

  RPROMPT='%{$fg[green]%}[%*]%{$reset_color%}'
}

prompt_tjkirch_setup() {
  #use extended color pallete if available
  if [[ ${TERM} == *256* || ${TERM} == *rxvt* ]]; then
    turquoise="%F{81}"
    orange="%F{166}"
    yellow="%F{yellow}"
    blue="%F{blue}"
    purple="%F{135}"
    magenta="%F{magenta}"
    hotpink="%F{161}"
    red="%F{red}"
    limegreen="%F{118}"
  else
    turquoise="%F{cyan}"
    orange="%F{yellow}"
    yellow="%F{yellow}"
    blue="%F{blue}"
    purple="%F{magenta}"
    magenta="%F{magenta}"
    hotpink="%F{red}"
    red="%F{red}"
    limegreen="%F{green}"
  fi

  # enable VCS systems you use
  zstyle ':vcs_info:*' enable git svn

  # check-for-changes can be really slow.
  # you should disable it, if you work with large repositories
  zstyle ':vcs_info:*:prompt:*' check-for-changes true

  # set formats
  # %b - branchname
  # %u - unstagedstr (see below)
  # %c - stagedstr (see below)
  # %a - action (e.g. rebase-i)
  # %R - repository path
  # %S - path in the repository
  PR_RST="%f"
  FMT_BRANCH="(%{$turquoise%}%b%u%c${PR_RST})"
  FMT_ACTION="(%{$limegreen%}%a${PR_RST})"
  FMT_UNSTAGED="%{$orange%} U"
  FMT_STAGED="%{$limegreen%} S"

  zstyle ':vcs_info:*:prompt:*' unstagedstr   "${FMT_UNSTAGED}"
  zstyle ':vcs_info:*:prompt:*' stagedstr     "${FMT_STAGED}"
  zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION}"
  zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"
  zstyle ':vcs_info:*:prompt:*' nvcsformats   ""

  PR_GIT_UPDATE=1

  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info
  autoload -Uz colors && colors

  add-zsh-hook preexec tjkirch_preexec
  add-zsh-hook chpwd tjkirch_chpwd
  add-zsh-hook precmd prompt_tjkirch_precmd
  prompt_opts=(cr subst percent)
}

prompt_tjkirch_setup "$@"
