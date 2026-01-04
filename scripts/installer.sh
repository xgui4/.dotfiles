#!/usr/bin/sh

echo "Xgui4 OS Dotfiles Installer - Prototype 2 Version"

echo "List of Operating System available?"

echo "1. Arch based OS"
echo "2. FreeBSD"

read -o -p 'What is your Operating System??' operating_system

if $operating_system == "1"; then
  echo "WARNING: this script is a work in progress and have not being tested"

  echo "First, do you want a XLibre or Xorg for an X server?"

  read -o -p 'So Do you want to Install XLibre ? (Y/N) ?' confirm_xlibre
  if [[ $confirm_xlibre == "Y" || $confirm_xlibre == "y" ]]; then
    curl -O https://x11libre.net/repo/arch_based/x86_64/install-xlibre.sh 
    sudo chmod +x install-xlibre.sh
    sudo ./install-xlibre.sh || echo -e "${RED}[Error]${ENDCOLOR} XLibre installation script has failed."
  fi

  else  
    sudo pacman -S xorg-server;
  fi

  # Define the JSON file
  ARCH="arch/arch-essential-pkg.json"
  I3="arch/i3-setup.json"
  HYPRARCH="arch/hyprarch-setup.json"
  QTILE="arch/qtile-setup.json"

  packages=($(jq -r '.pacman[]' "$ARCH"))
  sudo pacman -S --noconfirm ${packages[@]}

  aur=($(jq -r '.aur[]' "$ARCH"))
  yay -S --needed --noconfirm ${aur[@]}

  packages=($(jq -r '.pacman[]' "$I3"))
  sudo pacman -S --needed --noconfirm ${packages[@]}

  packages=($(jq -r '.pacman[]' "$HYPRARCH"))
  sudo pacman -S --needed --noconfirm ${packages[@]}

  aur=($(jq -r '.aur[]' "$HYPRARCH"))
  yay -S --needed --noconfirm ${aur[@]}

  packages=($(jq -r '.pacman[]' "$QTILE"))
  sudp pacman -S --needed --noconfirm ${packages[@]}

  aur=($(jq -r '.aur[]' "$QTILE"))
  yay -S --needed --noconfirm ${aur[@]}

fi

else 
  echo "WARNING: this script is a work in progress and have not being tested"

  echo "Do you want to install an X11 Server for an X11 Window Manager?"

  read -o -p 'Do you want to install an X11 Server for an X11 Window Manager? (Y/N)' confirm_x11
  if [[ $confirm_x11 == "Y" || $confirm_x11 == "y" ]]; then
    sudo pkg install -y xorg-server
  fi

  # Define the JSON file
  ESSENTIAL="freebsd/freebsd-essential-pkg.json"
  I3="freebsd/i3-setup.json"

  packages=($(jq -r '.pacman[]' "$ESSENTIAL"))
  sudo pkg install -y ${packages[@]}

  packages=($(jq -r '.pacman[]' "$I3"))
  sudo pkg install -y ${packages[@]}
fi