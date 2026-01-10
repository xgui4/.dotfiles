#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ "$XDG_SESSION_TYPE" = "x11" ]; then
   export MOZ_USE_XINPUT2=1
   export QT_QPA_PLATFORMTHEME=qt5ct
   export XDG_MENU_PREFIX=arch
   export QT_QPA_PLATFORM=xcb
fi

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
export PATH="$PATH:/usr/local/bin/"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"