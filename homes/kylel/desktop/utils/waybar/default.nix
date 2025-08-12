{
  pkgs-unstable,
  config,
  ...
}: let
  settings = import ./settings.nix;
  style = import ./style.nix;
in {
  # Configure & Theme Waybar
  programs.waybar = {
    enable = true;
    package = pkgs-unstable.waybar;
    systemd.enable = true;

    inherit settings;
    # inherit style;
    style = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dotfiles/config/waybar/style.css";
  };
}
