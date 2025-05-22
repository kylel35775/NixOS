{
  pkgs,
  inputs,
  ...
}: let
  username = builtins.baseNameOf (builtins.toString ./.);
  inherit (import ./user-variables.nix) waybarChoice;
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
in {
  nix.settings.allowed-users = ["${username}"];

  users.users.${username} = {
    isNormalUser = true;
    description = "";
    extraGroups = [
      "adbusers"
      "docker"
      "input"
      "libvirtd"
      "lp"
      "networkmanager"
      "scanner"
      "wheel"
    ];

    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  home-manager = {
    users.${username} = {
      inherit imports;

      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "23.11";
      };
      xdg.userDirs = {
        enable = true;
        createDirectories = true;
        extraConfig = {
          XDG_MUSIC_LIBRARY_DIR = "/home/${username}/Music/Library";
          XDG_MUSIC_DOWNLOADS_DIR = "/home/${username}/Music/Downloads";
          XDG_SCREENSHOTS_DIR = "/home/${username}/Pictures/Screenshots";
          XDG_WALLPAPERS_DIR = "/home/${username}/Pictures/Wallpapers";
        };
      };
    };
  };
}
