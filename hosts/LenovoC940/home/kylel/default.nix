_: let
  inherit (import ./user-variables.nix) waybarChoice;
in {
  imports = [
    ./amfora.nix
    ./bash.nix
    ./bashrc-personal.nix
    ./bat.nix
    ./beets.nix
    ./btop.nix
    ./calcure.nix
    ./cava.nix
    ./emoji.nix
    ./fastfetch
    ./gh.nix
    ./ghostty.nix
    ./git.nix
    ./gtk.nix
    ./htop.nix
    ./hyprland
    ./kitty.nix
    ./nvf.nix
    ./rofi
    ./qt.nix
    ./scripts
    ./starship.nix
    ./stylix.nix
    ./swappy.nix
    ./swaync.nix
    ./termusic.nix
    ./virtmanager.nix
    ./wallrizz
    ./waybar/${waybarChoice}
    ./wezterm.nix
    ./wlogout
    ./yazi
    ./xdg.nix
    ./zoxide.nix
    ./zsh
  ];
}
