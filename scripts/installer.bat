#!/bin/sh

echo "Preparing installer"

echo "Installing Yay AUR Helper"

# Exit on any error
set -e

sudo pacman -S --needed --noconfirm base-devel git

git clone https://aur.archlinux.org/yay.git /tmp/yay

cd /tmp/yay
makepkg -si --noconfirm

cd "$HOME"
rm -rf /tmp/yay

echo "yay installation complete!"

echo "Installing jq"

sudo pacman -S --needed --noconfirm jq

echo "First, do you want a XLibre or Xorg for an X server?"

printf "So Do you want to Install XLibre ? (Y/N) ?"
read -r confirm_xlibre

if [ "$confirm_xlibre" = "Y" ] || [ "$confirm_xlibre" = "y" ]; then
    curl -O https://x11libre.net/repo/arch_based/x86_64/install-xlibre.sh 
    sudo chmod +x "install-xlibre.sh"
    sudo "./install-xlibre.sh" || echo "[Error] XLibre installation script has failed."
else
    sudo pacman -S xorg-server
fi

qtile_choosen=0
hyprland_choosen=0
i3_choosen=0
spectrwm_choosen=0

printf "Do you want to install i3 ?"
read -r user_input

if [ "$user_input" = "yes" ] || [ "$user_input" = "Yes" ]; then
    i3_choosen=1
fi 

printf "Do you want to install Qtile ?"
read -r user_input

if [ "$user_input" = "yes" ] || [ "$user_input" = "Yes" ]; then
    qtile_choosen=1
fi 

printf "Do you want to install Hyprland ?"
read -r user_input

if [ "$user_input" = "yes" ] || [ "$user_input" = "Yes" ]; then
    hyprland_choosen=1
fi 

printf "Do you want to install spectrwm ?"
read -r user_input

if [ "$user_input" = "yes" ] || [ "$user_input" = "Yes" ]; then
    spectrwm_choosen=1
fi 

# Define the JSON file
ARCH="$HOME/.dotfiles/scripts/arch/arch-essential-pkg.json"
I3="$HOME/.dotfiles/scripts/arch/i3-setup.json"
HYPRARCH="$HOME/.dotfiles/scripts/arch/hyprarch-setup.json"
QTILE="$HOME/.dotfiles/scripts/arch/qtile-setup.json"

packages=$(jq -r '.pacman[]' "$ARCH")
sudo pacman -S --noconfirm "$packages"

aur=$(jq -r '.aur[]' "$ARCH")
yay -S --needed --noconfirm "$aur"

if [ "$i3_choosen" = 1 ]; then
    packages=$(jq -r '.pacman[]' "$I3")
    sudo pacman -S --needed --noconfirm "$packages"
fi

if [ "$hyprland_choosen" = 1 ]; then
    packages=$(jq -r '.pacman[]' "$HYPRARCH")
    sudo pacman -S --needed --noconfirm "$packages"
    aur=$(jq -r '.aur[]' "$HYPRARCH")
    yay -S --needed --noconfirm "$aur"
fi

if [ "$qtile_choosen" = 1 ]; then
    packages=$(jq -r '.pacman[]' "$QTILE")
    sudo pacman -S --needed --noconfirm "$packages"
    aur=$(jq -r '.aur[]' "$QTILE")
    yay -S --needed --noconfirm "$aur"
fi

cd "$HOME/.dotfiles"

if [ "$qtile_choosen" = 1 ]; then 
    stow --adopt qtile
fi

if [ "$hyprland_choosen" = 1 ]; then 
    stow --adopt hyprland 
    stow --adopt waybar 
    stow --adopt hyprshell 
    stow --adopt caelestia 
    stow --adopt quickshell
fi

if [ "$i3_choosen" = 1 ]; then 
    stow --adopt i3 
    stow --adopt polybar 
    stow --adopt picom 
fi

if [ "$spectrwm_choosen" = 1 ]; then 
    stow  --adopt spectrwm
fi

stow --adopt bash 
stow --adopt fastfetch 
stow --adopt fish 
stow --adopt gtk 
stow --adopt kitty 
stow --adopt libinput-gestures 
stow --adopt kitty 
stow --adopt qt 
stow --adopt rofi 
stow --adopt starship 
stow --adopt wallpapers 
stow --adopt xsettings
stow --adopt flameshot
stow --adopt account-profile
