alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -ahlF --color=auto'
alias lsd="find . -mindepth 1 -maxdepth 1 -type d"
alias l.="ls -d .*"
alias grep='grep --color=auto'
alias egrep="egrep --color=auto"
alias eg="egrep"
alias trace="tracepath"
alias h="history"
alias diff="diff -NurwBd"
alias duh="du -h --max-depth=1"
alias burnnew="growisofs -Z /dev/cdrom -graft-points -JRU"
alias burnadd="growisofs -M /dev/cdrom -graft-points -JRU"
alias cal="cal -s"
alias slide="feh -g 500x500 -drZsD3"
alias slider="feh -g 500x500 -zdrZsD3"
alias vlc="vlc -L"
alias vlcr="vlc -Z"
alias mplayer="mpv"
alias randfile='find . -type f | sed -e "s/ /\\\\ /g" | sort -R | head -1'
alias websync='rsync -ahiuzH --progress --delay-updates --exclude "wp-content/cache/*" --exclude ".git" --delete --delete-delay'
alias x='exec startx'
alias tmux='tmux -2'

alias mv='nocorrect mv -i'       # no spelling correction on mv
alias cp='nocorrect cp'          # no spelling correction on cp
alias mkdir='nocorrect mkdir -p' # no spelling correction on mkdir

alias psg="ps -A | grep"
alias pseg="ps -ef | grep"
alias psag="ps aux | grep"

alias ..="cd .."
alias ...="cd ../.."

alias susp='sudo pm-suspend --auto-quirks'
alias off='sudo /usr/bin/systemctl poweroff'
alias reboot='sudo /usr/bin/systemctl reboot'

alias dhcp='sudo dhcpcd -t 600 wlan0'

alias ngserver='(export CLASSPATH=".:${CLASSPATH}" && cd ~/.vim/bundle/vimclojure/bin && nohup ./ng-server >/dev/null 2>&1) &'

alias view='vim -R'
alias vie=view

# A vim window ready with two diff panes
alias vimp='vim -c "set paste | vnew | windo diffthis | wincmd h"'

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
alias mypackages="find -L /var/db/paludis/repositories/installed/indices/packages/ -type d -exec grep -l tjkirch {}/REPOSITORY  \; 2>/dev/null | sed -e 's/.*packages\///' -e 's/:C.*//'"
alias allpackages="ls /var/db/paludis/repositories/installed/data/ | sed -e 's/---/\//'"
alias full-upgrade='allpackages | xargs cave resolve --keep-targets if-same'
alias full-upgrade-real='allpackages | xargs sudo cave resolve -1x --keep-targets if-same'

alias gs='git status'
alias ga='git add'
alias gap='git add --patch'
alias gd='git diff'
alias gdc='git diff --cached'
alias gr='git rebase'
alias gri='git rebase -i'
alias gco='git checkout'
alias gl='git log'
alias gls='git log --stat'
alias glp='git log -p'
alias gbr='git branch -va'
alias gc='git commit -v'
alias gp='git pull --rebase'
alias gsb='git show-branch'
alias gcp='git cherry-pick'
alias gitk='gitk --all 2>/dev/null &'

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
alias -g ND='*(/om[1])' # newest directory
alias -g NF='*(.om[1])' # newest file

autoload zmv
autoload zcp
alias mmv='noglob zmv -W'
alias mcp='noglob zcp -W'
alias mln='noglob zln -W'
