#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

## launch terminal daemon ##
if ! pidof urxvtd; then
    urxvtd -q -o -f &
fi

## Set wallpaper
feh --bg-scale -z -r  ~/pictures/wallpapers

if ! pidof xcompmgr; then
    xcompmgr &
fi

#while true; do
    ##vol = $(awk '/dB/ { gsub(/[\[\]]/,""); print $5}' <(amixer get Master | grep 'Front Left:'))
    #xsetroot -name "$(free -m | grep '^Mem' | awk '{printf "[ Mem: %dMB / %dMB ( %d% ) ]", $3, $2, $3*100/$2  }')  [ $( date +'%X %x' ) ]"
    #sleep 1s    # Update time every second
#done &

conky | while read -r; do xsetroot -name "$REPLY"; done &
exec dwm
