#!/usr/bin/env bash

set -e

cd .. 

cd quickshell/.config/quickshell

git clone https://github.com/xgui4/caelestia-shell.git shell

cd shell

# Compile  my fork of caelestia-shell
cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/
cmake --build build
sudo cmake --install build

sudo cp assets/wayland-sessions/caelestia-shell.desktop  /usr/share/wayland-sessions/caelestia-shell.desktop
