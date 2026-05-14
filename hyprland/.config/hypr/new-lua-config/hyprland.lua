----------------------------------------------------
-- HyprArch 0.1.0 (Lua/Hyprland 0.55 Update)   ----
--  By Xgui4                                   ----
----------------------------------------------------

------------------
---- MONITORS ----
------------------

-- require("monitors.lua")
dofile("/home/xgui4/.dotfiles/hyprland/.config/hypr/new-lua-config/monitors.lua")

-------------------
---- PROGRAMS ----
-------------------

terminal = "kitty"  -- default terminal 
fileManager = "dolphin" -- default file manager
browser = "firefox" -- default browser
menu = "rofi" -- default launcher/menu 
emoji = "rofimoji --action copy clipboard" -- default emoji picker
clipboardManager = "copyq" -- defaiut clipboard manager 
local screenshotUtiliy = "hyprshot -m region" -- default screenshot utility

-------------------
---- AUTOSTART ----
-------------------

-- require("autostart.lua")
dofile("/home/xgui4/.dotfiles/hyprland/.config/hypr/new-lua-config/autostart.lua")

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- require("env.lua")
-- require("nvidia.lua")
dofile("/home/xgui4/.dotfiles/hyprland/.config/hypr/new-lua-config/env.lua")
dofile("/home/xgui4/.dotfiles/hyprland/.config/hypr/new-lua-config/nvidia.lua")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- require("appearence.lua")
dofile("/home/xgui4/.dotfiles/hyprland/.config/hypr/new-lua-config/appearence.lua")

---------------
---- INPUT ----
---------------

-- require("input.lua")
dofile("/home/xgui4/.dotfiles/hyprland/.config/hypr/new-lua-config/input.lua")

---------------------
---- PERMISSIONs ----
---------------------

-- require("permission.lua")
dofile("/home/xgui4/.dotfiles/hyprland/.config/hypr/new-lua-config/permission.lua")

---------------------
---- KEYBINDINGS ----
---------------------

-- require("keybinding.lua")
dofile("/home/xgui4/.dotfiles/hyprland/.config/hypr/new-lua-config/keybinding.lua")
hl.bind("PRINT" .. "", hl.dsp.exec_cmd(screenshotUtiliy))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- require("windows-rule.lua")
dofile("/home/xgui4/.dotfiles/hyprland/.config/hypr/new-lua-config/windows-rule.lua")

------------------
-- Fix for apps --
-------------------

-- TODO : Find the new synthax
-- xwayland:force_zero_scaling = true

--------------------
-- Plugins config --
---------------------

-- require("plugins.lua")
dofile("/home/xgui4/.dotfiles/hyprland/.config/hypr/new-lua-config/plugins.lua")
