{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    variety
  ];

  home.activation.copyMyFile = lib.hm.dag.entryAfter ["writeBoundary"] ''
    rm -f "${config.home.homeDirectory}/.config/variety/scripts/set_wallpaper"
    cp ${./variety.sh} "${config.home.homeDirectory}/.config/variety/scripts/set_wallpaper"
    chmod +700 "${config.home.homeDirectory}/.config/variety/scripts/set_wallpaper"
  '';
}
