{pkgs, ...}: {
  home.packages = with pkgs; [
    hyprland-qtutils # Needed for Banners and ANR Messages
    hyprpicker # Wayland Color Picker
    wl-clipboard # CLI Copy/Paste Utility
    ydotool # CLI Automation Tool
  ];
}
