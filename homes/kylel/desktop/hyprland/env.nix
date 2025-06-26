{pkgs, ...}: {
  wayland.windowManager.hyprland.settings.env = [
    # Defaults
    "EDITOR, nvim"
    "DEFAULT_BROWSER, ${pkgs.vivaldi}/bin/vivaldi"

    # Mozilla FireFox
    "MOZ_ENABLE_WAYLAND, 1"

    # NixOS Vars
    "NIXOS_OZONE_WL, 1"
    "NIXPKGS_ALLOW_UNFREE, 1"

    # XDG Specifications
    "XDG_CURRENT_DESKTOP, Hyprland"
    "XDG_SESSION_TYPE, wayland"
    "XDG_SESSION_DESKTOP, Hyprland"

    # Toolkit Backend Vars
    "GDK_BACKEND, wayland, x11"
    "QT_QPA_PLATFORM, wayland"
    "CLUTTER_BACKEND, wayland"
    ### EAC doesn't like this one, keep commented unless needed.
    ### "SDL_VIDEODRIVER, x11"

    # Toolkit Window Theming Vars
    "GDK_SCALE, 1" # GDK only supports integer scaling
    "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
    ### If you manually set the screen factor, it is important to set
    ### QT_AUTO_SCREEN_SCALE_FACTOR=0 and QT_ENABLE_HIGHDPI_SCALING=0
    ### otherwise some applications which explicitly force high DPI enabling get scaled twice.
    "QT_SCALE_FACTOR, 1"
    "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
    "QT_ENABLE_HIGHDPI_SCALING, 1"

    # Mostly needed for hybrid laptops, can result in inop cfg. Comment if needed.
    "AQ_DRM_DEVICES, /dev/dri/card0:/dev/dri/card1"

    # Nvidia
    "LIBVA_DRIVER_NAME,nvidia"
    "__GLX_VENDOR_LIBRARY_NAME,nvidia"
    ### NIXOS_OZONE_WL already hints this, setting this just in case
    "ELECTRON_OZONE_PLATFORM_HINT,auto"
    ### Likely already handled by hardware.nvidia.videoAcceleration, setting just in case
    ### VA-API may help resolve issues in Electron apps
    "NVD_BACKEND, direct"
  ];
}
