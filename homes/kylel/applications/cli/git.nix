let
  inherit (import ../../user-variables.nix) gitUsername gitEmail;
in {
  programs.git = {
    enable = true;

    settings = {
      user.name = "${gitUsername}";
      user.email = "${gitEmail}";
    };
  };
}
