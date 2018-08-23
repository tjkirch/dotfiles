alias l='ls'

if [ "$(uname -s)" = "Darwin" ]; then
   alias ls='ls -G'
   alias ll='ls -ahlFG'
else
   alias ls='ls --color=auto'
   alias ll='ls -ahlF --color=auto'
fi

alias e='exa --time-style=iso'
alias el='exa -l --time-style=iso'
alias et='exa -l --time-style=iso --tree'

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

if [ "$(uname -s)" = "Darwin" ]; then
   alias upd='echo "brew update:"; brew update && echo -e "\nbrew outdated:" && brew outdated'
   alias upg='echo "brew upgrade:" && brew upgrade && echo -e "\nbrew cleanup:" && brew cleanup'
else
   alias as='aptitude search'
   alias ai='sudo aptitude install'
   alias ais='aptitude install -s'
   alias yl='yum list'
   alias yin='yum info'
   alias yi='sudo yum install'
   alias xupdate='sudo snapper create --command "xbps-install -Su" -d "system update"'
   alias xclean='sudo xbps-remove -O'
   alias xorphans='sudo snapper create --command "xbps-remove -o" -d "orphan cleanup"'
   alias xlist='xbps-query -l'
   alias xfiles='xbps-query -f'
   alias xrfiles='xbps-query -R -f'
   alias xsearch='xbps-query -Rs'
   alias xshow='xbps-query -RS'
fi

xinstall() {
   sudo snapper create --command "xbps-install -S $*" -d "package install"
}
xremove() {
   sudo snapper create --command "xbps-remove -R $*" -d "package removal"
}

alias gs='git status'
alias ga='git add'
alias gap='git add --patch'
alias gd='git diff'
alias gdc='git diff --cached'
alias gr='git rebase'
alias gri='git rebase -i'
alias grc='git rebase --continue'
alias grh='git reset HEAD'
alias gco='git checkout'
alias gl='git log'
alias gls='git log --stat'
alias glp='git log -p'
alias ggh='git glog | head'
alias gb='git branch -va'
alias gc='git commit -v'
alias gsb='git show-branch -a'
alias gcp='git cherry-pick'
alias gmf='git merge --ff-only'
alias gitk='gitk --all 2>/dev/null &'

alias ss="svn status"
alias sup="svn update"
alias cup="cvs -z5 update"

alias cbd='cargo build'
alias cbr='cargo build --release'
alias ct='cargo test'
alias crd='cargo run'
alias crr='cargo run --release'

alias -g ND='*(/om[1])' # newest directory
alias -g NF='*(.om[1])' # newest file

autoload zmv
autoload zcp
alias mmv='noglob zmv -W'
alias mcp='noglob zcp -W'
alias mln='noglob zln -W'

[ -r ${HOME}/local/src/shell-directory-management/quick-directory-aliases.sh ] \
&& . ${HOME}/local/src/shell-directory-management/quick-directory-aliases.sh
