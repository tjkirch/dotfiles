alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -AhlF --color=auto'
alias lsd="find . -mindepth 1 -maxdepth 1 -type d"
alias l.="ls -d .*"
alias grep='grep --color=auto'
alias egrep="egrep --color=auto"
alias eg="egrep"
alias ag='ack-grep'
alias trace="tracepath"
alias h="history"
alias diff="diff -NurwBd"
alias duh="du -h --max-depth=1"
alias burnnew="growisofs -Z /dev/cdrom -graft-points -JRU"
alias burnadd="growisofs -M /dev/cdrom -graft-points -JRU"
alias cal="cal -s"
alias slide="feh -drZFsD3"
alias slider="feh -zdrZFsD3"
alias vlc="vlc -L"
alias vlcr="vlc -Z"
alias mplayer="mplayer -loop 0"
alias randfile='find . -type f | sed -e "s/ /\\\\ /g" | sort -R | head -1'
alias websync='rsync -azHuh --progress --delay-updates --exclude "wp-content/cache/*" --delete'
alias x='exec startx'

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
alias susp='sudo pm-suspend --auto-quirks'

alias dhcp='sudo dhcpcd -t 600 wlan0'

alias ngserver='(export CLASSPATH=".:${CLASSPATH}" && cd ~/.vim/bundle/vimclojure/bin && nohup ./ng-server >/dev/null 2>&1) &'

alias as='aptitude search'
alias ai='sudo aptitude install'
alias ais='aptitude install -s'
alias yl='yum list'
alias yin='yum info'
alias yi='sudo yum install'
alias update='sudo cave sync && cave search ignoreme >/dev/null 2>&1 &'
alias upgrade='cave resolve --recommendations display -C if-satisfied -c world'
alias upgrade-real='sudo nice cave resolve -x --recommendations display -C if-satisfied -c world'
alias pq='paludis --query'

alias gs='git status'
alias ga='git add'
alias gap='git add --patch'
alias gd='git diff'
alias gr='git rebase'
alias gri='git rebase -i'
alias gco='git checkout'
alias gl='git log'
alias gls='git log --stat'
alias glp='git log -p'
alias gb='git branch -v'
alias gc='git commit -v'
alias gp='git pull'

alias ss="svn status"
alias sup="svn update"
alias cup="cvs -z5 update"

alias -g L=' | less'
alias -g G=' | egrep'
alias -g V=' | vim'
alias -g W=' | wc'
alias -g C=' | wc -l'
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
