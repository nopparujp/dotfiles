#!/bin/sh
# Startup program

# Lockscreen
#betterlockscreen -u ~/Pictures/wallpaper.jpg --fx &
#xidlehook --not-when-fullscreen --not-when-audio --timer 830 "notify-send -u critical -t 10000 'LOCKING in 30s'" --timer 30 "systemctl suspend" &
#xss-lock --transfer-sleep-lock -- betterlockscreen -l &

# toggle language
setxkbmap -model pc105 -layout us,th -option grp:win_space_toggle &

# Auto set display output
autorandr --change

# Autostart Program
lxqt-policykit-agent &
picom &
parcellite &
flameshot &
numlockx &
nitrogen --restore
