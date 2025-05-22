{
  pkgs,
  username,
  ...
}: {
  home = {
    packages = with pkgs; [
      (callPackage ./derivation.nix {}) # TUI Wallpaper/System Theme Manager
    ];

    sessionVariables = {
      WALLPAPER_DIR = "/home/${username}/Pictures/Wallpapers";
    };
  };

  wayland.windowManager.hyprland.settings.env = [
    ''WALLPAPER_DIR,/home/${username}/Pictures/Wallpapers''
  ];
}
