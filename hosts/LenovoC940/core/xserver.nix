_: let
  inherit (import ../system-variables.nix) keyboardLayout;
in {
  services.xserver = {
    enable = false;
    xkb = {
      layout = "${keyboardLayout}";
      variant = "";
    };
  };
}
