{
  pkgs,
  config,
  ...
}: {
  xdg = {
    enable = true;
    mime.enable = true;

    mimeApps = {
      enable = true;

      defaultApplications = {
        "default-web-browser" = ["vivaldi-stable.desktop" "brave-browser.desktop"];
        "text/html" = ["vivaldi-stable.desktop" "brave-browser.desktop"];
        "x-scheme-handler/http" = ["vivaldi-stable.desktop" "brave-browser.desktop"];
        "x-scheme-handler/https" = ["vivaldi-stable.desktop" "brave-browser.desktop"];
        "x-scheme-handler/about" = ["vivaldi-stable.desktop" "brave-browser.desktop"];
        "x-scheme-handler/unknown" = ["vivaldi-stable.desktop" "brave-browser.desktop"];
      };
    };

    portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-hyprland];
      configPackages = [pkgs.hyprland];
    };

    userDirs = {
      enable = true;
      createDirectories = true;

      extraConfig = {
        XDG_MUSIC_LIBRARY_DIR = "${config.home.homeDirectory}/Music/Library";
        XDG_MUSIC_DOWNLOADS_DIR = "${config.home.homeDirectory}/Music/Downloads";
        XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/Pictures/Screenshots";
        XDG_WALLPAPERS_DIR = "${config.home.homeDirectory}/Pictures/Wallpapers";
      };
    };
  };
}
