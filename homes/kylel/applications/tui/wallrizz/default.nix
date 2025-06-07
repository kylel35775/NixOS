{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      (callPackage ./derivation.nix {}) # TUI Wallpaper/System Theme Manager
    ];

    sessionVariables = {
      WALLPAPER_DIR = "${config.home.homeDirectory}/Pictures/Wallpapers";
    };
  };

  wayland.windowManager.hyprland.settings.env = [
    ''WALLPAPER_DIR,${config.home.homeDirectory}/Pictures/Wallpapers''
  ];
}
