let
  inherit (import ../user-variables.nix) animChoice;
in {
  imports = [
    ./animations/${animChoice}
    ./binds.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./pyprland.nix
    ./windowrules.nix
  ];
}
