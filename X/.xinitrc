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

   on_ac_power && rfkill block wlan

   # disable yubikey by default to avoid accidental inputs
   yubi off

   enable-monitor
fi

urxvtd -q -f -o

xbindkeys

screensaver &

pipewire &

xplugd

my-redshift &

# copy/paste manager
parcellite &

# notifications
dunst &

# set pointer speed
xinput set-prop 'Clearly Superior Technologies. CST Laser Trackball' 'libinput Accel Speed' -0.5
xinput set-prop 'TPPS/2 Elan TrackPoint' 'libinput Accel Speed' 0

# enable DPMS
xset dpms 1200 1200 0

# mute mic by default
mic-off

rm -f .ssh/environment-*

exec i3
