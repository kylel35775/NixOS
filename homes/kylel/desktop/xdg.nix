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
        # Browser
        "default-web-browser" = ["vivaldi-stable.desktop" "brave-browser.desktop"];
        "text/html" = ["vivaldi-stable.desktop" "brave-browser.desktop"];
        "x-scheme-handler/http" = ["vivaldi-stable.desktop" "brave-browser.desktop"];
        "x-scheme-handler/https" = ["vivaldi-stable.desktop" "brave-browser.desktop"];
        "x-scheme-handler/about" = ["vivaldi-stable.desktop" "brave-browser.desktop"];
        "x-scheme-handler/unknown" = ["vivaldi-stable.desktop" "brave-browser.desktop"];

        # Video
        "video/mp4" = ["vlc.desktop" "umpv.desktop"];
        "video/mpeg" = ["vlc.desktop" "umpv.desktop"];
        "video/x-matroska" = ["vlc.desktop" "umpv.desktop"];
        "video/ogg" = ["vlc.desktop" "umpv.desktop"];
        "video/webm" = ["vlc.desktop" "umpv.desktop"];

        # Applications
        "application/pdf" = [""]; # .pdf

        "application/msword" = ["writer.desktop"]; # .doc/.dot/.w6w/.wiz/.word
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = ["writer.desktop"]; # .docx
        "application/vnd.openxmlformats-officedocument.wordprocessingml.template" = ["writer.desktop"]; # .dotx
        "application/vnd.ms-word.document.macroEnabled.12" = ["writer.desktop"]; # .docm
        "application/vnd.ms-word.template.macroEnabled.12" = ["writer.desktop"]; # .dotm

        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = ["calc.desktop"]; # .xlsx
        "application/vnd.openxmlformats-officedocument.spreadsheetml.template" = ["calc.desktop"]; # .xltx
        "application/vnd.ms-excel" = ["calc.desktop"]; # .xla/.xlhb/.xlc/.xlm/.xls/.xlt/.xlw
        "application/vnd.ms-excel.sheet.macroEnabled.12" = ["calc.desktop"]; # .xlsm
        "application/vnd.ms-excel.template.macroEnabled.12" = ["calc.desktop"]; # .xltm
        "application/vnd.ms-excel.addin.macroEnabled.12" = ["calc.desktop"]; # .xlam
        "application/vnd.ms-excel.sheet.binary.macroEnabled.12" = ["calc.desktop"]; # .xlsb

        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = ["impress.desktop"]; # .pptx
        "application/vnd.openxmlformats-officedocument.presentationml.slide" = ["impress.desktop"]; # .sldx
        "application/vnd.openxmlformats-officedocument.presentationml.slideshow" = ["impress.desktop"]; # .ppsx
        "application/vnd.openxmlformats-officedocument.presentationml.template" = ["impress.desktop"]; # .potx
        "application/vnd.ms-powerpoint" = ["impress.desktop"]; # .pot/.ppa/.pps/.ppt/.pwz
        "application/vnd.ms-powerpoint.addin.macroenabled.12" = ["impress.desktop"]; # .ppam
        "application/vnd.ms-powerpoint.presentation.macroenabled.12" = ["impress.desktop"]; # .pptm
        "application/vnd.ms-powerpoint.slide.macroenabled.12" = ["impress.desktop"]; # .sldm
        "application/vnd.ms-powerpoint.slideshow.macroenabled.12" = ["impress.desktop"]; # .ppsm
        "application/vnd.ms-powerpoint.template.macroenabled.12" = ["impress.desktop"]; # .potm
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
