#!/usr/bin/bash

echo "Xgui4 OS Dotfiles Installer - Prototype 2 Version"

# Variables
RED="\e[31m"
ENDCOLOR="\e[0m"

echo "This bash script is experimental and a work-in-progress !"

# installer for stuff temporaly removed as it was obselete

mkdir ~/.config-backup

cp -a .config/ ~/.config-backup/

mkdir ~/.config

cp -a fastfetch/ fish/ gtk-3.0/ gtk-4.0/ hypr/ i3/ kitty/ nwg-look/ picom/ polybar/ qt5ct/ qtile/ rofi/ wallpapers/ waybar/ ~/.config/ 

echo "This script is still not finished, some must be put manually for now"