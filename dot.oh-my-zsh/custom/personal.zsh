fortune -as

set -o vi
export EDITOR="vim"

# why does this get overwritten?
cp -a ~/.config/vlc/vlcrc{.good,}

cd  # why wouldn't it start in home?
