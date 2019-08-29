#!/bin/sh

# Source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        # shellcheck disable=SC1090
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

urxvtd -q -f -o

xbindkeys
xmodmap "${HOME}/.xmodmap"

xautolock -time 10 -locker 'i3lock -c 000000' -notify 15 -notifier "notify-send locking" &
xss-lock -- i3lock -n -c 000000 &

my-redshift &

# copy/paste manager
parcellite &

workrave &

set-trackball-speed

# mute mic by default
amixer set Capture nocap

exec i3
