[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

xbindkeys
exec i3
