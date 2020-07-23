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

screensaver &

my-redshift &

# copy/paste manager
parcellite &

workrave &

set-trackball-speed

# enable DPMS
xset dpms 1200 1200 0

# mute mic by default
amixer set Capture nocap

exec i3
