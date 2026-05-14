-- Cursor

hl.env("XCURSOR_SIZE", "25")
hl.env("XCURSOR_THEME", "Catppuccin Macchiato Mauve, 25")
hl.env("HYPRCURSOR_SIZE", "25")

-- Themes
hl.env("QT_QPA_PLATFORMTHEME","qt6ct") -- for Qt6 apps
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

-- Toolkit backends 
hl.env("GDK_BACKEND", "wayland, x11")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland, x11, windows")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Fix for dolphin 
hl.env("XDG_MENU_PREFIX","arch-")

-- XDG specifications 
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Others 
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
