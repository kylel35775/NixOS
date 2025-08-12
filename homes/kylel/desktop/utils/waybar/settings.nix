[
  {
    "layer" = "top";
    "position" = "top";
    "margin" = "0 8 0 8";
    "reload_style_on_change" = true;

    "modules-left" = [
      "custom/startmenu"
      "wlr/taskbar"
    ];
    "modules-center" = [
      "hyprland/workspaces"
    ];
    "modules-right" = [
      "tray"
      # "pulseaudio"
      "clock"
      "custom/notification"
    ];

    "custom/startmenu" = {
      "format" = "";
      "on-click" = "sleep 0.1 && rofi-launcher";
      "tooltip" = false;
    };
    "wlr/taskbar" = {
      "all-outputs" = false;
      "format" = "{icon}";
      "icon-size" = 26;
      "tooltip-format" = "{title}";
      "on-click" = "activate";
      "on-click-middle" = "close";

      "ignore-list" = [
        "Alacritty"
      ];
      "app_ids-mapping" = {
        "firefoxdeveloperedition" = "firefox-developer-edition";
      };
      "rewrite" = {
        "Firefox Web Browser" = "Firefox";
        "Foot Server" = "Terminal";
      };
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
      "icon-size" = 20;
      "spacing" = 10;
      "reverse-direction" = true;
    };
    # "pulseaudio" = {
    #   "on-click" = "sleep 0.1 && pavucontrol";
    #   "tooltip-format" = "{desc}: {volume}%";
    #
    #   "format" = "{icon}{format_source}";
    #   "format-muted" = "{format_source}";
    #   "format-source" = ""; # "";
    #   "format-source-muted" = " ";
    #   "format-bluetooth" = "{icon}|{format_source}";
    #   "format-bluetooth-muted" = "|{format_source}";
    #   "format-icons" = {
    #     "car" = "";
    #     "default" = [
    #       ""
    #       ""
    #       ""
    #     ];
    #     "hands-free" = "";
    #     "headphone" = "";
    #     "headset" = "";
    #     "phone" = "";
    #     "portable" = "";
    #   };
    # };
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
      "on-click" = "swaync-launcher";
      "return-type" = "json";
      "tooltip" = false;
    };
  }
]
