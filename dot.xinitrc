#urxvtd -q -f -o

xbindkeys
~/.dropbox-dist/dropboxd &

xrandr --output DVI-0 --primary --left-of DVI-1 --mode 1920x1080

(sleep 1; dzconky) &
my-redshift &
exec ssh-agent i3
