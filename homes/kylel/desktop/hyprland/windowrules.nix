let
  inherit (import ../../user-variables.nix) extraMonitorSettings;
in {
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        # Tags
        "tag +file-manager, class:^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$"
        "tag +terminal, class:^(Alacritty|kitty|kitty-dropterm)$"
        "tag +browser, class:^(Brave-browser(-beta|-dev|-unstable)?)$"
        "tag +browser, class:^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr)$"
        "tag +browser, class:^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$"
        "tag +browser, class:^([Tt]horium-browser|[Cc]achy-browser)$"
        "tag +browser, class:^([Vv]ivaldi-browser(-beta|-dev|-unstable)?)"
        "tag +projects, class:^(codium|codium-url-handler|VSCodium)$"
        "tag +projects, class:^(VSCode|code-url-handler)$"
        "tag +im, class:^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$"
        "tag +im, class:^([Ff]erdium)$"
        "tag +im, class:^([Ww]hatsapp-for-linux)$"
        "tag +im, class:^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$"
        "tag +im, class:^(teams-for-linux)$"
        "tag +games, class:^(gamescope)$"
        "tag +games, class:^(steam_app_\d+)$"
        "tag +gamestore, class:^([Ss]team)$"
        "tag +gamestore, title:^([Ll]utris)$"
        "tag +gamestore, class:^(com.heroicgameslauncher.hgl)$"
        "tag +settings, class:^(gnome-disks|wihotspot(-gui)?)$"
        "tag +settings, class:^([Rr]ofi)$"
        "tag +settings, class:^(file-roller|org.gnome.FileRoller)$"
        "tag +settings, class:^(nm-applet|nm-connection-editor|blueman-manager)$"
        "tag +settings, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        "tag +settings, class:^(nwg-look|qt5ct|qt6ct|[Yy]ad)$"
        "tag +settings, class:(xdg-desktop-portal-gtk)"
        "tag +settings, class:(.blueman-manager-wrapped)"
        "tag +settings, class:(nwg-displays)"
        "tag +settings, class:(clipse)"
        "tag +settings, class:(wallrizz)"

        # Center
        "center, class:^([Ff]erdium)$"
        "center, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        "center, class:([Tt]hunar), title:negative:(.*[Tt]hunar.*)"
        "center, title:^(Authentication Required)$"

        # Idle Inhibit
        "idleinhibit fullscreen, class:^(*)$"
        "idleinhibit fullscreen, title:^(*)$"
        "idleinhibit fullscreen, fullscreen:1"

        # Float
        "float, tag:settings*"
        "float, class:^([Ww]aypaper)$"
        "float, class:^([Ff]erdium)$"
        "float, title:^(Picture-in-Picture)$"
        "float, class:^(mpv|com.github.rafostar.Clapper)$"
        "float, title:^(Discord Popout)$"
        "float, title:^(Authentication Required)$"
        "float, class:(codium|codium-url-handler|VSCodium), title:negative:(.*codium.*|.*VSCodium.*)"
        "float, class:^(com.heroicgameslauncher.hgl)$, title:negative:(Heroic Games Launcher)"
        "float, class:^([Ss]team)$, title:negative:^([Ss]team)$"
        "float, class:([Tt]hunar), title:negative:(.*[Tt]hunar.*)"
        "float, initialTitle:(Add Folder to Workspace)"
        "float, initialTitle:(Open Files)"
        "float, initialTitle:(wants to save)"

        # Sizing
        "size 70% 60%, initialTitle:(Open Files)"
        "size 70% 60%, initialTitle:(Add Folder to Workspace)"
        "size 70% 70%, tag:settings*"
        "size 60% 70%, class:^([Ff]erdium)$"

        # Opacity
        "opacity 1.0 1.0, tag:browser*"
        "opacity 0.9 0.8, tag:projects*"
        "opacity 0.9 0.8, tag:file-manager*"
        "opacity 0.9 0.8, tag:terminal*"
        "opacity 0.8 0.7, tag:settings*"
        "opacity 0.8 0.7, class:^(gedit|org.gnome.TextEditor|mousepad)$"
        "opacity 0.9 0.8, class:^(seahorse)$ # gnome-keyring gui"
        "opacity 0.8 0.7, class:^([Rr]hythmbox)$"
        "opacity 0.95 0.75, title:^(Picture-in-Picture)$"

        "move 72% 7%,title:^(Picture-in-Picture)$"

        "pin, title:^(Picture-in-Picture)$"

        "keepaspectratio, title:^(Picture-in-Picture)$"

        "noblur, tag:games*"

        "fullscreen, tag:games*"

        # Flameshot screen capture compatability rules
        "noanim, class:flameshot, title:flameshot"
        "norounding, class:flameshot, title:flameshot"
        "noborder, class:flameshot, title:flameshot"
        "stayfocused, class:flameshot, title:flameshot"
        "float, class:flameshot"
        "pin, class:flameshot, title:flameshot"
        "move 0 0, class:flameshot, title:flameshot"
      ];

      layerrule = [
        "blur, waybar"
        "ignorezero, waybar"
        "ignorealpha, 0.5, waybar"

        "blur, swaync-control-center"
        "ignorezero, swaync-control-center"
        "ignorealpha, 0.5, swaync-control-center"
        "animation slide right, swaync-control-center"

        "blur, swaync-notification-window"
        "ignorezero, swaync-notification-window"
        "ignorealpha, 0.5, swaync-notification-window"
      ];
    };

    extraConfig = ''
      monitor=,preferred,auto,auto

      ${extraMonitorSettings}
    '';
  };
}
