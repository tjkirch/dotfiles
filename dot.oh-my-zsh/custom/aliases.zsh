alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -ahlF --color=auto'
alias grep='grep --color=auto'
alias ag='ack-grep'

alias off='sudo shutdown -h now'
alias reboot='sudo reboot'

alias dhcp='sudo dhcpcd -t 600 wlan0'

alias ngserver='java com.martiansoftware.nailgun.NGServer 127.0.0.1'

alias wstat='ifconfig wlan0; iwconfig wlan0'
alias wifi='sudo /usr/local/bin/wireless simple && (ping -c1 google.com >/dev/null 2>&1 || ping -c1 google.com >/dev/null 2>&1 &)'

alias headphones='amixer sset Front mute && amixer sset Surround unmute'
alias speakers='amixer sset Front unmute && amixer sset Surround mute'

alias as='aptitude search'
alias ai='sudo aptitude install'
alias ais='aptitude install -s'

alias gs='git status'
alias ga='git add'
alias gap='git add --patch'
alias gd='git diff'
alias gr='git rebase'
alias gri='git rebase -i'
alias gco='git checkout'

alias -g L=' | less'
alias -g G=' | egrep'
alias -g V=' | vim'
alias -g W=' | wc'
alias -g A=' | awk'
alias -g S=' | sed'
alias -g X=' | xargs'

autoload zmv
alias mmv='noglob zmv -W'
alias mcp='noglob zcp -W'
alias mln='noglob zln -W'
