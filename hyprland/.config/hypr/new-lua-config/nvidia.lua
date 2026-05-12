-- Nvidia related config
-- see more info : https://wiki.hypr.land/Nvidia
hl.env("LIBVA_DRIVER_NAME","nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME","nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT","auto") -- Wayland Support Electron App
hl.env("GBM_BACKEND","nvidia-drm")