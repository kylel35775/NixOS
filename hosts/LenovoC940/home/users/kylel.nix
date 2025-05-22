{
  pkgs,
  # host,
  # profile,
  inputs,
  ...
}: let
  username = "kylel";
in {
  nix.settings.allowed-users = ["${username}"];

  # users.mutableUsers = true;
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

  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    # programs.home-manager.enable = true;

    # useUserPackages = true;
    # useGlobalPkgs = false;
    # backupFileExtension = "backup";
    # extraSpecialArgs = {inherit inputs host profile;};

    users.${username} = {
      imports = [../${username}];

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
