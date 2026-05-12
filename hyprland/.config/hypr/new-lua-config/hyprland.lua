----------------------------------------------------
-- HyprArch 0.1.0 (Lua/Hyprland 0.55 Update)   ----
--  By Xgui4                                   ----
----------------------------------------------------

------------------
---- MONITORS ----
------------------

dofile("monitors.lua")

-------------------
---- PROGRAMS ----
-------------------

local terminal = "kitty"  -- default terminal 
local fileManager = "dolphin" -- default file manager
local browser = "firefox" -- default browser
local menu = "rofi" -- default launcher/menu 
local emoji = "rofimoji --action copy clipboard" -- default emoji picker
local clipboardManager = "copyq" -- defaiut clipboard manager 
local screenshotUtiliy = "hyprshot -m region" -- default screenshot utility

-------------------
---- AUTOSTART ----
-------------------

dofile("autostart.lua")

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

dofile("env.lua")

dofile("nvidia.lua")

-----------------------
---- LOOK AND FEEL ----
-----------------------

dofile("appearence.lua")

---------------
---- INPUT ----
---------------

dofile("input.lua")

---------------------
---- PERMISSIONs ----
---------------------

dofile("permission.lua")

---------------------
---- KEYBINDINGS ----
---------------------

dofile("keybinding.lua")
hl.bind("PRINT" .. "", hl.dsp.exec_cmd(screenshotUtiliy))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

dofile("windows-rule.lua")

------------------
-- Fix for apps --
-------------------

-- TODO : Find the new synthax
-- xwayland:force_zero_scaling = true

--------------------
-- Plugins config --
---------------------

dofile("~/.config/hypr/plugins.lua")
