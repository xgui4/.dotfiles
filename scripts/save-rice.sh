#!/bin/sh

printf "Do you want to save your config to a backup folder first? Yes/No (Recommend): "
read -r backup

if [ "$backup" = "yes" ] || [ "$backup" = "Yes" ]; then
    cd "$HOME/.dotfiles" || exit 1
    mkdir -p backup/gtk backup/qt

    # Standard cp works as expected
    cp -r "$HOME/.config/gtk-3.0" "$HOME/.config/gtk-4.0" "$HOME/.gtkrc-2.0" backup/gtk/
    cp -r "$HOME/.config/qt5ct" "$HOME/.config/qt6ct" "$HOME/.config/Kvantum" backup/qt/
fi

printf "Do you want to git-stow your config? Yes/No: "
read -r _stow

if [ "$_stow" = "yes" ] || [ "$_stow" = "Yes" ]; then
    cd "$HOME" || exit 1
    DOT_DIR="$HOME/.dotfiles"

    setup_stow_pkg() {
        local pkg="$1"
        local file_path="$2"
        local dir_in_pkg="$DOT_DIR/$pkg/$(dirname "$file_path")"
        
        mkdir -p "$dir_in_pkg"
        mv "$HOME/$file_path" "$dir_in_pkg/"
    }

    setup_stow_pkg "gtk" ".config/gtk-3.0/settings.ini"
    setup_stow_pkg "gtk" ".config/gtk-4.0/settings.ini"
    setup_stow_pkg "gtk" ".gtkrc-2.0"

    setup_stow_pkg "qt" ".config/qt5ct/qt5ct.conf"
    setup_stow_pkg "qt" ".config/qt6ct/qt6ct.conf"
    setup_stow_pkg "qt" ".config/Kvantum/kvantum.kvconfig"

    echo "Ricing moved to $DOT_DIR and symlinked via Stow."
    cd "$DOT_DIR" && stow --adopt gtk qt
else
    echo "Program has exited. Reason: Cancelled operation."
    exit 0
fi
