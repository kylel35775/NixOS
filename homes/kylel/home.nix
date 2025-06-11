let
  username = builtins.baseNameOf (builtins.toString ./.);
in {
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    stateVersion = "23.11"; # DO NOT CHANGE !!!
  };
}
