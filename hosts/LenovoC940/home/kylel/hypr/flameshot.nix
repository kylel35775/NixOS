{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    grim # CLI Screenshot Utility
  ];

  # Feature Rich Screenshot Daemon
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot;

    settings = {
      General = {
        disabledTrayIcon = true;
        savePath = "${config.home.homeDirectory}/Pictures/Screenshots";
        showStartupLaunchMessage = false;
      };
    };
  };
}
