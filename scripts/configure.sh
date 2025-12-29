#!/usr/bin/bash

echo "WARNING: this script is a work in progress and have not being tested"

echo "I recommend XLibre"

read -o -p 'So Do you want to Install XLibre ? (Y/N) ?' confirm_xlibre
if [[ $confirm_xlibre == "Y" || $confirm_xlibre == "y" ]]; then
  curl -O https://x11libre.net/repo/arch_based/x86_64/install-xlibre.sh 
  sudo chmod +x install-xlibre.sh
  sudo ./install-xlibre.sh || echo -e "${RED}[Error]${ENDCOLOR} XLibre installation script has failed."
fi

# Define the JSON file
ARCH="arch-essential-pkg.json"
I3="i3-setup.json"
HYPRARCH="hyprarch-setup.json"
QTILE="qtile-setup.json"

packages=($(jq -r '.pacman[]' "$ARCH"))
sudo pacman -S ${packages[@]}

aur=($(jq -r '.aur[]' "$ARCH"))
yay -S ${aur[@]}

packages=($(jq -r '.pacman[]' "$I3"))
sudo pacman -S ${packages[@]}

packages=($(jq -r '.pacman[]' "$HYPRARCH"))
sudo pacman -S ${packages[@]}

aur=($(jq -r '.aur[]' "$HYPRARCH"))
yay -S ${aur[@]}

packages=($(jq -r '.pacman[]' "$QTILE"))
sudp pacman -S ${packages[@]}

aur=($(jq -r '.aur[]' "$QTILE"))
yay -S ${aur[@]}