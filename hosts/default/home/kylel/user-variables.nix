{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "kylel35775";
  gitEmail = "kylel35775@gmail.com";

  # Hyprland Settings
  extraMonitorSettings = ''
    monitor=,preferred,auto,1.25
  '';

  # Program Options
  browser = "vivaldi"; # Set Default Browser (google-chrome-stable for google-chrome)
  terminal = "kitty"; # Set Default System Terminal

  # Set Waybar
  # Includes alternates such as waybar-curved.nix & waybar-ddubs.nix
  waybarChoice = "waybar-custom.nix";

  # Set Animation style
  # Available options are:
  # animations-def.nix  (default)
  # animations-end4.nix (end-4 project)
  # animations-dynamic.nix (ml4w project)
  animChoice = "animations-end4-custom.nix";
}
