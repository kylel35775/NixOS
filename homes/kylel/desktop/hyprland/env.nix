{pkgs, ...}: {
  wayland.windowManager.hyprland.settings.env = [
    # Defaults
    "EDITOR, nvim"
    "DEFAULT_BROWSER, ${pkgs.vivaldi}/bin/vivaldi"

    # App envs
    "CLUTTER_BACKEND, wayland"
    "MOZ_ENABLE_WAYLAND, 1"

    # NixOS envs
    "NIXOS_OZONE_WL, 1"
    "NIXPKGS_ALLOW_UNFREE, 1"

    # XDG envs
    "XDG_CURRENT_DESKTOP, Hyprland"
    "XDG_SESSION_TYPE, wayland"
    "XDG_SESSION_DESKTOP, Hyprland"

    # GDK envs
    "GDK_BACKEND, wayland, x11"
    "GDK_SCALE, 1" # GDK only supports integer scaling

    # QT envs
    "QT_QPA_PLATFORM, wayland"
    "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
    ### If you manually set the screen factor, it is important to set
    "QT_SCALE_FACTOR, 1"
    "QT_AUTO_SCREEN_SCALE_FACTOR, 1" # QT_AUTO_SCREEN_SCALE_FACTOR=0 and
    "QT_ENABLE_HIGHDPI_SCALING, 1" # QT_ENABLE_HIGHDPI_SCALING=0
    ### otherwise some applications which explicitly force high DPI enabling get scaled twice.

    # Mostly needed for hybrid laptops, can result in inop cfg. Comment if needed.
    "AQ_DRM_DEVICES, /dev/dri/card0:/dev/dri/card1"

    # EAC doesn't like this one, keep commented unless needed.
    # "SDL_VIDEODRIVER, x11"
  ];
}
