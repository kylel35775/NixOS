{config, ...}: 
let
  image = "${config.home.homeDirectory}/Pictures/Wallpapers/nix-wallpaper-stripes-logo.png";
in {
  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;

    settings = {
      scalingPriority = "hyprland";

      wallpaper = {
        enable = false;
        inherit image;
      };

      # ================= BAR ================= #
      bar = {
        layouts = {
          "*" = {
            left = ["dashboard" "windowtitle" "media"];
            middle = ["workspaces"];
            right = ["systray" "volume" "bluetooth" "network" "clock" "notifications"];
          };
        };

        # ----- Left -----
        launcher = {
          autoDetectIcon = true;
        };

        windowtitle = {};

        media = {
          truncation_size = 45;
        };

        # ----- Middle -----
        workspaces = {
          show_icons = false; # 
          showWsIcons = true;
          showApplicationIcons = true;
          applicationIconOncePerWorkspace = true;
        };

        # ----- Right -----
        systray = {};

        volume = {
          label = false;
          rightClick = "pavucontrol";
        };
        
        bluetooth = {
          label = false;
          rightClick = "blueman-manager";
        };

        network = {
          label = false;
          showWifiInfo = true;
          rightClick = "";
        };

        clock = {
          format = "%b. %e | %I:%M %p";
        };
      };

      # ================= MENUS ================= #
      menus = {
        dashboard = {
          powermenu.logout = "loginctl terminate-user ${config.home.username}";
          directories.enabled = false;
          controls.enabled = false;

          shortcuts = {
            left = {
              shortcut1 = {
                icon = "󰖟";
                tooltip = "Vivaldi";
                command = "vivaldi";
              };
              shortcut2 = {
                icon = "󰎆";
                tooltip = "Youtube Music";
                command = "xdg-open https://music.youtube.com";
              };
              shortcut3 = {
                tooltip = "Vesktop";
                command = "vesktop";
              };
              # shortcut4 = {};
            };

            right = {
              # shortcut1 = {};
              # shortcut2 = {};
              shortcut3 = {
                command = "screenshot";
              };
              # shortcut4 = {};
            };
          };
        };

        clock = {
          time = {
            military = true;
            hideSeconds = false;
          };
          weather.unit = "imperial";
        };

        power.logout = "loginctl terminate-user ${config.home.username}";

        volume.raiseMaximumVolume = true;
      };

      # ================= THEME ================= #
      theme = {
        font = {
          name = "CaskaydiaCove NF";
          size = "16px";
        };

        matugen = true;
        matugen_settings = {
          mode = "dark";
          scheme_type = "fidelity";
          variation = "monochrome_1";  
        };

        bar = {
          border = {
            location = "none";
            width = "0.0em";
          };

          transparent = false; # Bar Background
          opacity = 50;
          outer_spacing = "0.2em"; # Left-Right Bar Padding
          
          # Floating Settings
          floating = true;
          border_radius = "0.0em 0.0em 0.6em 0.6em";
          margin_top = "0.0em";
          margin_bottom = "0.0em";
          margin_sides = "0.5em";
        };

        osd = {
          orientation = "horizontal";
          location = "bottom";
        };
      };
    };
  };
}
