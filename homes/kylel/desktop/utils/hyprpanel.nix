{
  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;

    settings = {
      scalingPriority = "hyprland";

      bar = {
        layouts = {
          "*" = {
            left = ["dashboard" "workspaces" "media"];
            middle = ["clock"];
            right = ["systray" "volume" "bluetooth" "network" "notifications"];
          };
        };

        media.truncation_size = 45;
        clock.format = "%A %b. %e | %I:%M %p";

        launcher.autoDetectIcon = true;
        workspaces.show_icons = true;

        bluetooth = {
          label = false;
          rightClick = "blueman-manager";
        };

        network = {
          label = false;
          showWifiInfo = true;
          rightClick = "";
        };

        volume = {
          label = false;
          rightClick = "pavucontrol";
        };
      };

      menus = {
        clock = {
          time = {
            military = true;
            hideSeconds = false;
          };
          weather.unit = "imperial";
        };

        dashboard = {
          powermenu.logout = "loginctl terminate-user $USER";
          directories.enabled = false;
          controls.enabled = false;
          shortcuts.right.shortcut3.command = "screenshot";
        };

        power.logout = "loginctl terminate-user $USER";

        volume.raiseMaximumVolume = true;
      };

      # THEME
      theme = {
        bar.transparent = true;

        font = {
          name = "CaskaydiaCove NF";
          size = "16px";
        };

        osd = {
          orientation = "horizontal";
          location = "bottom";
        };
      };
    };
  };
}
