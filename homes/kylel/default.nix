let
  username = builtins.baseNameOf (builtins.toString ./.);
  imports = [
    ./bash.nix
    ./bat.nix
    ./beets.nix
    ./btop.nix
    ./cava.nix
    ./emoji.nix
    ./fastfetch
    ./gh.nix
    ./ghostty.nix
    ./git.nix
    ./gtk.nix
    ./htop.nix
    ./hypr
    ./kitty.nix
    ./nvf.nix
    ./rofi
    ./qt.nix
    ./scripts
    ./starship.nix
    ./stylix.nix
    ./swaync.nix
    ./termusic.nix
    ./virtmanager.nix
    ./wallrizz
    ./waybar.nix
    ./wlogout
    ./yazi
    ./xdg.nix
    ./zoxide.nix
    ./zsh
  ];
in {
  inherit imports;

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11"; # DO NOT CHANGE !!!
  };
}
