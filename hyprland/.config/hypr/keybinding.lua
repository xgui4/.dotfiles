local mainMod = "SUPER" 
local left = { x = -10, y = 0, relative = true }
local down = { x = 0, y = 10, relative = true }
local up = { x = 0, y = -10, relative = true }
local right = { x = 10, y = 0, relative = true }

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(emoji))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("rofi -show run"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))   -- dwindle only
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("rofi -show powermenu")) 

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. "  + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. "  + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- source : https://github.com/end-4/dots-hyprland/blob/97c5bc65/dots/.config/hypr/hyprland/keybinds.lua
for i = 1, 4 do
    local arrowkey = { "Left", "Right", "Up", "Down" }
    local focusdir = { "l", "r", "u", "d" }
    hl.bind("SUPER + SHIFT + " .. arrowkey[i], hl.dsp.window.move({ direction = focusdir[i] }),
        { description = "Window: Move " .. arrowkey[i] })
end

--# Window split ratio
--#/# binde = SUPER, ;/',, -- Adjust split ratio
hl.bind(mainMod .. " + Semicolon", hl.dsp.layout("splitratio -0.1"), { repeating = true })
hl.bind(mainMod .. " + Apostrophe", hl.dsp.layout("splitratio +0.1"), { repeating = true })

hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }), 
    { description = "Window: Float/Tile" })
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }), 
    { description = "Window: Maximize" })
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }),
    { description = "Window: Fullscreen" })
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 3, action = "toggle" }), 
    { description = "Window: Fullscreen spoof" })
hl.bind(mainMod .. " + P", hl.dsp.window.pin(),
     { description = "Window: Pin" })

-- source : https://forum.hypr.land/t/resize-window-with-keyboard/2020

local function opts(direction)
  return { description = 'Resize the active window ' .. direction, repeating = true }
end

hl.bind(mainMod .. " + ALT + h", hl.dsp.window.resize(left), opts("left"))
hl.bind(mainMod .. " + ALT + j", hl.dsp.window.resize(down), opts("down"))
hl.bind(mainMod .. " + ALT + k", hl.dsp.window.resize(up), opts("up"))
hl.bind(mainMod .. " + ALT + l", hl.dsp.window.resize(right), opts("right"))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("swayosd-client --brightness raise"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("swayosd-client --brightness lower"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
