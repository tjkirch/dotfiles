alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -ahlF --color=auto'
alias lsd="find . -mindepth 1 -maxdepth 1 -type d"
alias l.="ls -d .*"
alias grep='grep --color=auto'
alias egrep="egrep --color=auto"
alias eg="egrep"
alias ag='ack-grep'
alias trace="tracepath"
alias h="history"
alias hg="history | grep"
alias diff="diff -NurwBd"
alias duh="du -h --max-depth=1"
alias burnnew="growisofs -Z /dev/cdrom -graft-points -JRU"
alias burnadd="growisofs -M /dev/cdrom -graft-points -JRU"

alias mv='nocorrect mv -i'       # no spelling correction on mv
alias cp='nocorrect cp'          # no spelling correction on cp
alias mkdir='nocorrect mkdir -p' # no spelling correction on mkdir

alias psg="ps -A | grep"
alias pseg="ps -ef | grep"
alias psag="ps aux | grep"

alias ..="cd .."
alias ...="cd ../.."

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
alias gl='git log'
alias gb='git branch'
alias gc='git commit'
alias gp='git pull'

alias ss="svn status"
alias sup="svn update"
alias cup="cvs -z5 update"

alias -g L=' | less'
alias -g G=' | egrep'
alias -g V=' | vim'
alias -g W=' | wc'
alias -g A=' | awk'
alias -g S=' | sort'
alias -g X=' | xargs'
alias -g H=' | head'
alias -g T=' | tail'
alias -g U=' | uniq'

autoload zmv
alias mmv='noglob zmv -W'
alias mcp='noglob zcp -W'
alias mln='noglob zln -W'
