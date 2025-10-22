{config, ...}: let
  settings = import ./settings.nix;
  style = import ./style.nix;
in {
  services.swaync = {
    enable = false;

    inherit settings;

    style = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dotfiles/config/swaync/style.css";
  };
}
