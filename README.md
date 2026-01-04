# Xgui4 OS Dotfiles

> [!NOTE]
> This branch is my personal config who change often for stability the xgui4-os/.dotfiles is prefered or a other dotfiles made for daily use.

My dotfiles of my GNU/Linux System, including HyprArch (my hyprland setup) and i3wm and qtile config and terminal config and a work in progress installer.

## How to use

### to install the dotfiles

> [!CAUTION]
> This could override your config, so make sure you backup your .dotfiles first!

0. (Optional) Use the `scripts/installer.sh`  file to install the neccesary packages
1. Put the git repo in `home/<your username>/.dotfiles`
2. Backup your .config folder
3. `git stow --adopted <package>` you want to install
4. Keep the folder

### to update the dotfiles manually

> [!CAUTION]
> This could override your config, so make sure you backup your .dotfiles first!

```bash

git pull

```
