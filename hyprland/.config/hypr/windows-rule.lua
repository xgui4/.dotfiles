hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name  = "Picture in Picture mode",
    match = { title = "Incrustation vidéo"},
    float = true,
    pin = true,
    ["hyprbars:no_bar"] = true
})

hl.window_rule({
    name  = "Picture-in-Picture mode (english)",
    match = { title = "Picture-in-Picture"},
    float = true,
    pin = true,
    ["hyprbars:no_bar"] = true
})

hl.window_rule({
    name  = "Center Volume Control",
    match = { class = "org.pulseaudio.pavucontrol" },
    float = true,
    pin = true
})

hl.window_rule({
    name  = "Center Blueman",
    match = { class = "blueman-manager" },
    float = true,
    pin = true
})

hl.window_rule({
    name = "No title bar for tiled windows",
    match = { float = false },
    ["hyprbars:no_bar"] = true
})
