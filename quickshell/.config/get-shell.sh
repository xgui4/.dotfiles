#!/usr/bin/env bash

# Install my fork of caelestia-shell
git clone https://github.com/xgui4/caelestia-shell.git shell

cd shell || echo "Error: Could not install the caelestia-shell dotfiles" && exit

# Compile  my fork of caelestia-shell
cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/
cmake --build build
sudo cmake --install build