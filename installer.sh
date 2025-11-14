#!/usr/bin/bash

echo "HyperArch Dotfiles Installer - Prototype Version"

# Variables
RED="\e[31m"
ENDCOLOR="\e[0m"

echo "This bash script is experimental and a work-in-progress !"

read -r -p 'Do you want to install yay AUR helper. This is required to install AUR packages via this script (Y/N) (may be already installed on your system) ?' confirm_yay
if [[ $confirm_yay == "Y" || $confirm_yay == "y"]]; then
    # Install yay AUR helper
    sudo pacman -S --needed git base-devel || echo -e "${RED}[Error]${ENDCOLOR} Failed to install git and base-devel packages."
    git clone https://aur.archlinux.org/yay.git || echo -e "${RED}[Error]${ENDCOLOR} Failed to clone yay repository."
    cd yay || echo -e "${RED}[Error]${ENDCOLOR} Failed to change directory to yay."
    makepkg -si || echo -e "${RED}[Error]${ENDCOLOR} Failed to build and install yay."
    cd .. || echo -e "${RED}[Error]${ENDCOLOR} Failed to change directory back."
    rm -rf yay || echo -e "${RED}[Error]${ENDCOLOR} Failed to remove yay directory."
fi

read -r -p 'Do you want to update the system before installing the apps (Recommended) (Y/N) ?' confirm

# Update the system (recommended)
if [[ $confirm == "Y" || $confirm == "y" ]]; then
    sudo pacman -Syu
    yay -Syu || echo -e "${RED}[Error]${ENDCOLOR} yay is not installed or have failed to run."
fi

# Installing packages with pacman
sudo pacman -S --needed $(< pacman-essentials) || echo -e "${RED}[Error]${ENDCOLOR} Some packages from pacman-essentials have failed to install."

read -r -p 'Do you want to install additional applications (Y/N) ?' confirm_apps
if [[ $confirm_apps == "Y" || $confirm_apps == "y" ]]; then
    sudo pacman -S --needed $(< pacman-apps) || echo -e "${RED}[Error]${ENDCOLOR} Some packages from pacman-apps have failed to install."

    # Installing packages from the AUR
    yay -S $(< aur) || echo -e "${RED}[Error]${ENDCOLOR} yay is not installed or have failed to run."
fi

# Enable sddm login manager
sudo systemctl enable sddm.service || echo -e "${RED}[Error]${ENDCOLOR} Failed to enable sddm service."

read -o -p 'Do you want to Install XLibre ? (Y/N) ?' confirm_xlibre
if [[ $confirm_xlibre == "Y" || $confirm_xlibre == "y" ]]; then
    curl -O https://x11libre.net/repo/arch_based/x86_64/install-xlibre.sh 
    sudo chmod +x install-xlibre.sh
    sudo ./install-xlibre.sh || echo -e "${RED}[Error]${ENDCOLOR} XLibre installation script has failed."
fi

cp -r * ~/.config/ || echo -e "${RED}[Error]${ENDCOLOR} Failed to copy dotfiles to ~/.config/."