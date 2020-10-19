#!/bin/sh

# Source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        # shellcheck disable=SC1090
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb -merge "${HOME}/.Xdefaults"

if is-laptop; then
   xrdb -merge "${HOME}/.Xdefaults.laptop"
   xinput set-prop "TPPS/2 Elan TrackPoint" "libinput Accel Speed" -0.6

   xmodmap "${HOME}/.xmodmap.laptop"

   # disable yubikey by default to avoid accidental inputs
   yubi off

   enable-monitor
fi

urxvtd -q -f -o

xbindkeys

screensaver &

my-redshift &

# copy/paste manager
parcellite &

# network manager
nm-applet &

set-trackball-speed

# enable DPMS
xset dpms 1200 1200 0

# mute mic by default
amixer set Capture nocap mute

rm -f .ssh/environment-*

exec i3
