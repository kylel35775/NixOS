{
  pkgs,
  config,
  lib,
  ...
}: let
  browser = ["vivaldi-stable.desktop" "brave-browser.desktop"];
  media-player = ["vlc.desktop" "umpv.desktop"];
  pdf-viewer = [""];
  word-processor = ["writer.desktop"];
  spreadsheet-editor = ["calc.desktop"];
  presentation-editor = ["impress.desktop"];
in {
  home.file = lib.optionalAttrs config.xdg.userDirs.enable {
    "${config.xdg.userDirs.templates}" = {
      recursive = true;
      source = ./templates;
    };
  };

  xdg = {
    enable = true;

    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-wlr
        xdg-desktop-portal-hyprland
      ];
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

    mime.enable = true;
    mimeApps = {
      enable = true;

      defaultApplications = {
        # Browser
        "default-web-browser" = browser;
        "text/html" = browser;
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "x-scheme-handler/about" = browser;
        "x-scheme-handler/unknown" = browser;

        # Video
        "video/mp4" = media-player;
        "video/mpeg" = media-player;
        "video/x-matroska" = media-player;
        "video/ogg" = media-player;
        "video/webm" = media-player;

        # Applications
        "application/pdf" = pdf-viewer; # .pdf

        "application/msword" = word-processor; # .doc/.dot/.w6w/.wiz/.word
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = word-processor; # .docx
        "application/vnd.openxmlformats-officedocument.wordprocessingml.template" = word-processor; # .dotx
        "application/vnd.ms-word.document.macroEnabled.12" = word-processor; # .docm
        "application/vnd.ms-word.template.macroEnabled.12" = word-processor; # .dotm

        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = spreadsheet-editor; # .xlsx
        "application/vnd.openxmlformats-officedocument.spreadsheetml.template" = spreadsheet-editor; # .xltx
        "application/vnd.ms-excel" = spreadsheet-editor; # .xla/.xlhb/.xlc/.xlm/.xls/.xlt/.xlw
        "application/vnd.ms-excel.sheet.macroEnabled.12" = spreadsheet-editor; # .xlsm
        "application/vnd.ms-excel.template.macroEnabled.12" = spreadsheet-editor; # .xltm
        "application/vnd.ms-excel.addin.macroEnabled.12" = spreadsheet-editor; # .xlam
        "application/vnd.ms-excel.sheet.binary.macroEnabled.12" = spreadsheet-editor; # .xlsb

        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = presentation-editor; # .pptx
        "application/vnd.openxmlformats-officedocument.presentationml.slide" = presentation-editor; # .sldx
        "application/vnd.openxmlformats-officedocument.presentationml.slideshow" = presentation-editor; # .ppsx
        "application/vnd.openxmlformats-officedocument.presentationml.template" = presentation-editor; # .potx
        "application/vnd.ms-powerpoint" = presentation-editor; # .pot/.ppa/.pps/.ppt/.pwz
        "application/vnd.ms-powerpoint.addin.macroenabled.12" = presentation-editor; # .ppam
        "application/vnd.ms-powerpoint.presentation.macroenabled.12" = presentation-editor; # .pptm
        "application/vnd.ms-powerpoint.slide.macroenabled.12" = presentation-editor; # .sldm
        "application/vnd.ms-powerpoint.slideshow.macroenabled.12" = presentation-editor; # .ppsm
        "application/vnd.ms-powerpoint.template.macroenabled.12" = presentation-editor; # .potm
      };
    };
  };
}
