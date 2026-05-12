-- Autostart applications for Hyprland

hl.exec_cmd("waybar")
hl.exec_cmd("hyprpaper")
hl.exec_cmd("hypridle")
hl.exec_cmd("copyq")
hl.exec_cmd("hyprpm reload")
hl.exec_cmd("nm-applet")
hl.exec_cmd("blueman-applet")
hl.exec_cmd("XDG_MENU_PREFIX=kde- kbuildsycoca6")
hl.exec_cmd("hyprsunset")
hl.exec_cmd("brightnessctl s 100%")
hl.exec_cmd("flameshot")
hl.exec_cmd("swayosd-server")

-- hpyrpolkit agent, for the auth agent, you change choose a other one if you want
hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")

-- Quickshell 
hl.exec_cmd("qs -c overview") 