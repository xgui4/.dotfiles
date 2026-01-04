if [ "$XDG_SESSION_TYPE" = "x11" ]; then
   export MOZ_USE_XINPUT2=1
   export QT_QPA_PLATFORMTHEME=qt5ct
   export XDG_MENU_PREFIX=arch
   export QT_QPA_PLATFORM=xcb
fi
