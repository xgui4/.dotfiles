#!/bin/sh
picom --config ~/.dotfiles/picom/.config/picom/picom.square.border.conf &

copyq &

flameshot &

dunst & 

nm-applet &

blueman-applet &

libinput-gestures-setup start &
