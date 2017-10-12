[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

xbindkeys
# Swap ctrl and esc
xmodmap ~/.capsswap
exec i3
