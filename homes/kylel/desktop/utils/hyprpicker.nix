{pkgs, ...}: {
  home.packages = with pkgs; [
    hyprpicker # Wayland Color Picker
  ];
}
