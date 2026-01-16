#
# ~/.profile
#

if [ "$XDG_SESSION_TYPE" = "x11" ]; then
   export env QT_QPA_PLATFORMTHEME=qt6ct # it work
   export env QT_QPA_PLATFORM=xcb
fi
