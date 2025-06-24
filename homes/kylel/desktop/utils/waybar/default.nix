let
  settings = import ./settings.nix;
  style = import ./style.nix;
in {
  # Configure & Theme Waybar
  programs.waybar = {
    enable = true;

    inherit settings;
    inherit style;
  };
}
