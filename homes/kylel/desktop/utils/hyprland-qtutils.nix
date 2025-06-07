{pkgs, ...}: {
  home.packages = with pkgs; [
    hyprland-qtutils # Needed for Banners and ANR Messages
  ];
}
