#!/bin/sh

# 1. Initialization and Safety
echo "WARNING: work in progress"
printf "Do you want to continue? (Y/N) "
read -r response

if [ "$response" != "Y" ] && [ "$response" != "y" ]; then
  echo "Exiting..."
  exit 1
fi

echo "Xgui4 OS Dotfiles Installer - BSD-Tested Version"

if [ -f "gtk/gtkrc-2.0" ]; then
  echo "Preparing the gtk and icons theme" 
  touch gtk/.gtkrc-2.0
  cat gtk/.gtkrc-2.0-pre-defned > gtk/.gtkrc-2.0
  touch gtk/.icons/default/icon.theme
  cat gtk/icons/default/index.default.theme > gtk/.icon/default/icon.theme
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi

echo "List of Operating System availables :"
echo "1. Arch based OS"
echo "2. FreeBSD"
printf "\n"
printf "What is your Operating System?"

read -r operating_system

if [ $operating_system = "1" ]; then 
  ./arch-installer 
fi

else; ./freebsd-installer
