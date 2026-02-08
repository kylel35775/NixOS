{
  wayland.windowManager.hyprland.settings.exec-once = [
    "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "variety"
    "pypr &"
    "[workplace 1 silent] steam"
    "[workplace 2 silent] vesktop"
    "[workplace 3 silent] $DEFAULT_BROWSER"
  ];
}
