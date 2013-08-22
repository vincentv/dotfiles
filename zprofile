[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

#disable beep
xset -b
