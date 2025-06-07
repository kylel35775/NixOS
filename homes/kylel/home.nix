let
  username = builtins.baseNameOf (builtins.toString ./.);
in {
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    stateVersion = "23.11"; # DO NOT CHANGE !!!
  };
}
