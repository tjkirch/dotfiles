# Defined in - @ line 1
function x --wraps='startx' --description 'fancy startx'
    set -gx XDG_SESSION_TYPE x11
    exec dbus-launch --exit-with-session startx -- vt(fgconsole) $argv
end
