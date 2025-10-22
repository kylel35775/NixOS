{
  "$schema" = "/etc/xdg/swaync/configSchema.json";
  "positionX" = "right";
  "positionY" = "top";
  "layer" = "overlay";
  "control-center-layer" = "top";
  "layer-shell" = true;
  "cssPriority" = "application";

  "control-center-width" = 380;
  "control-center-margin-top" = 8;
  "control-center-margin-bottom" = 8;
  "control-center-margin-right" = 0;
  "control-center-margin-left" = 0;

  "notification-2fa-action" = true;
  "notification-inline-replies" = false;
  "notification-window-width" = 380;
  "notification-icon-size" = 48;
  "notification-body-image-height" = 180;
  "notification-body-image-width" = 180;
  "timeout" = 8;
  "timeout-low" = 4;
  "timeout-critical" = 0;

  "fit-to-screen" = true;
  "keyboard-shortcuts" = true;
  "image-visibility" = "when-available";
  "transition-time" = 150;
  "hide-on-clear" = false;
  "hide-on-action" = false;
  "script-fail-notify" = true;

  "widgets" = [
    "title"
    "dnd"
    "notifications"
    "mpris"
    "volume"
    "backlight"
    "buttons-grid"
    "menubar#label"
  ];

  "widget-config" = {
    "title" = {
      "text" = "Notifications";
      "clear-all-button" = true;
      "button-text" = "Clear";
    };

    "dnd" = {
    };

    "mpris" = {
      "autohide" = true;
      "image-size" = 80;
      "image-radius" = 10;
    };

    "volume" = {
      "label" = "";
      "step" = 5;
      "show-per-app" = true;
      "empty-list-label" = "No Active Media...";
      "expand-button-label" = "↓";
      "collapse-button-label" = "↑";
    };

    "backlight" = {
      "label" = "󰃞";
      "step" = 5;
    };

    "buttons-grid" = {
      "actions" = [
        {
          "label" = "";
          "command" = "hyprlock";
          "tooltip" = "Lock";
        }
        {
          "label" = "⏾";
          "command" = "systemctl suspend";
          "tooltip" = "Sleep";
        }
        {
          "label" = "󰜉";
          "command" = "reboot";
          "tooltip" = "Reboot";
        }
        {
          "label" = "⏻";
          "command" = "shutdown now";
          "tooltip" = "Power Off";
        }
      ];
    };

    "menubar#label" = {
      "buttons#power-menu" = {
        "position" = "right";
        "actions" = [
          {
            "label" = "";
            "command" = "hyprlock";
          }
          {
            "label" = "";
            "command" = "loginctl terminate-user $USER";
          }
          {
            "label" = "⏾";
            "command" = "systemctl suspend";
          }
          {
            "label" = "";
            "command" = "systemctl reboot";
          }
          {
            "label" = "";
            "command" = "systemctl poweroff";
          }
        ];
      };
    };
  };
}
