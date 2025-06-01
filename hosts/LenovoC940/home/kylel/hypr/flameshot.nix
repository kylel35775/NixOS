{pkgs, ...}: {
  home.packages = with pkgs; [
    grim # CLI Screenshot Utility
  ];

  # Feature Rich Screenshot Daemon
  services.flameshot = {
    enable = true;

    settings = {
      General = {
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
      };
    };
  };
}
