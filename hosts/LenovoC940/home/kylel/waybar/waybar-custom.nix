{
  pkgs,
  config,
  ...
}: {
  # home.file."./.config/waybar" = {
  #   enable = true;
  #   source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/.config/";
  # };

  # Configure & Theme Waybar
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;

    settings = [
      {
        "layer" = "top";
        "position" = "top";
        "margin" = "0 8 0 8";
        "reload_style_on_change" = true;

        "modules-left" = [
          "custom/startmenu"
          "idle_inhibitor"
        ];
        "modules-center" = [
          "hyprland/workspaces"
        ];
        "modules-right" = [
          "tray"
          "pulseaudio"
          "battery"
          "clock"
          "custom/notification"
        ];

        "custom/startmenu" = {
          "format" = "";
          "on-click" = "sleep 0.1 && rofi-launcher";
          "tooltip" = false;
        };
        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "︎⏻";
            "deactivated" = "︎⏾";
          };
          "tooltip-format-activated" = "Idle Inhibited";
          "tooltip-format-deactivated" = "Idle Permitted";
          "timeout" = 240; # (In minutes) Deactivate inhibitor after 4 hours
        };

        "hyprland/workspaces" = {
          "format" = "{name}";
          "format-icons" = {
            "active" = " ";
            "default" = " ";
            "urgent" = " ";
          };
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
        };

        "tray" = {
          "spacing" = 12;
          "reverse-direction" = true;
        };
        "pulseaudio" = {
          "on-click" = "sleep 0.1 && pavucontrol";
          "tooltip-format" = "{desc}: {volume}%";

          "format" = "{icon}{format_source}";
          "format-muted" = "{format_source}";
          "format-source" = ""; # "";
          "format-source-muted" = " ";
          "format-bluetooth" = "{icon}|{format_source}";
          "format-bluetooth-muted" = "|{format_source}";
          "format-icons" = {
            "car" = "";
            "default" = [
              ""
              ""
              ""
            ];
            "hands-free" = "";
            "headphone" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
          };
        };
        "battery" = {
          "on-click" = "";
          "interval" = 15;
          "states" = {
            "warning" = 25;
            "critical" = 10;
          };

          "format" = "{icon}";
          "format-charging" = "󰂄";
          "format-icons" = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          "format-plugged" = "󱘖 ";
          "tooltip-format" = "Battery: {capacity}%";
        };
        "clock" = {
          "format" = "<span><small>{:%H:%M %p%n%D}</small></span>";
          "tooltip" = true;
          "tooltip-format" = "<big>{:%A, %d.%B %Y }</big>\n<tt><small>{calendar}</small></tt>";
        };
        "custom/notification" = {
          "escape" = true;
          "exec" = "swaync-client -swb";
          "exec-if" = "which swaync-client";
          "format" = "{icon}";
          "format-icons" = {
            "dnd-inhibited-none" = "";
            "dnd-inhibited-notification" = "<span foreground='red'><sup></sup></span>";
            "dnd-none" = "";
            "dnd-notification" = "<span foreground='red'><sup></sup></span>";
            "inhibited-none" = "";
            "inhibited-notification" = "<span foreground='red'><sup></sup></span>";
            "none" = "";
            "notification" = "<span foreground='red'><sup></sup></span>";
          };
          "on-click" = "sleep 0.1 && task-waybar";
          "return-type" = "json";
          "tooltip" = false;
        };
      }
    ];

    style = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/.config/waybar/style.css";
    # concatStrings [
    #   ''
    #     * {
    #       font-family: "JetBrainsMono Nerd Font Propo";
    #       font-weight: bold;
    #       font-size: 14px; /* Font size changes height level automatically to fit (excluding top and bottom margins for individual elements) */
    #
    #       border-radius: 0;
    #       border: none;
    #
    #       min-height: 20px;
    #     }
    #     #waybar {
    #       background: transparent;
    #     }
    #     window#waybar {
    #       border-radius: 0px 0px 10px 10px;
    #       background: #${config.lib.stylix.colors.base00};
    #       color: #${config.lib.stylix.colors.base05};
    #     }
    #     tooltip {
    #       background: #${config.lib.stylix.colors.base00};
    #       border: 1px solid #${config.lib.stylix.colors.base08};
    #       border-radius: 12px;
    #     }
    #     tooltip label {
    #       color: #${config.lib.stylix.colors.base08};
    #     }
    #
    #     /*
    #      * modules-left
    #      */
    #
    #     #custom-startmenu {
    #       font-size: 22px;
    #       color: #${config.lib.stylix.colors.base08};
    #       margin: 0px 0px 0px 8px;
    #     }
    #
    #     /*
    #      * modules-center
    #      */
    #
    #     #workspaces {
    #     }
    #     #workspaces button {
    #       padding: 5px;
    #       color: #${config.lib.stylix.colors.base04};
    #       opacity: 0.7;
    #     }
    #     #workspaces button.active {
    #       color: #${config.lib.stylix.colors.base08};
    #       border-bottom: 3px solid;
    #       opacity: 1.0;
    #     }
    #     #workspaces button:hover {
    #       color: #${config.lib.stylix.colors.base08};
    #       background: #${config.lib.stylix.colors.base04};
    #       opacity: 0.8;
    #     }
    #
    #     /*
    #      * modules-right
    #      */
    #
    #     #tray, #pulseaudio, #battery {
    #       color: #${config.lib.stylix.colors.base08};
    #       margin: 0px 8px 0px 0px;
    #       padding: 0px 8px 0px 0px;
    #       border-right: 1px solid #${config.lib.stylix.colors.base04};
    #     }
    #     #clock {
    #       color: #${config.lib.stylix.colors.base08};
    #       margin: 0px 8px 0px 0px;
    #       padding: 0px 0px 0px 0px;
    #       border-right: 0px solid #${config.lib.stylix.colors.base04};
    #     }
    #     #custom-notification {
    #       color: #${config.lib.stylix.colors.base08};
    #       margin: 0px 8px 0px 0px;
    #     }
    #   ''
    # ];
  };
}
