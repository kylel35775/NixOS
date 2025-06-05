{pkgs, ...}: {
  xdg = {
    enable = true;
    mime.enable = true;

    mimeApps = {
      enable = true;
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
        XDG_MUSIC_LIBRARY_DIR = "/home/${username}/Music/Library";
        XDG_MUSIC_DOWNLOADS_DIR = "/home/${username}/Music/Downloads";
        XDG_SCREENSHOTS_DIR = "/home/${username}/Pictures/Screenshots";
        XDG_WALLPAPERS_DIR = "/home/${username}/Pictures/Wallpapers";
      };
    };
  };
}
