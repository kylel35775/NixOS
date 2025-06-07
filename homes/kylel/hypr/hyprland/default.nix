let
  inherit (import ../../user-variables.nix) animChoice;
in {
  imports = [
    ./animations/${animChoice}
    ./binds.nix
    ./env.nix
    ./execs.nix
    ./general.nix
    ./windowrules.nix
  ];
}
