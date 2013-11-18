#!/bin/sh

# Source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

urxvtd -q -f -o

xbindkeys
xmodmap ~/.xmodmap

~/.dropbox-dist/dropboxd &

xrandr --output DVI-0 --primary --left-of DVI-1 --mode 1920x1080 --rotate right

(sleep 1; dzconky) &
my-redshift &

mpd >/home/tjkirch/.mpd/log 2>&1
mpdscribble &

exec i3
