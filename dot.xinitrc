urxvtd -q -f -o
xbindkeys

~/.dropbox-dist/dropboxd &
(sleep 1; dzconky) &
my-redshift &
exec ssh-agent i3
