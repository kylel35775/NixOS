{
  services = {
    hypridle = {
      enable = true;

      settings = {
        general = {
          lock_cmd = "hyprlock";
          before_sleep_cmd = "loginctl lock-session"; # Lock if manually slept
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listener = [
          # Lock after 15 minutes
          {
            timeout = 900;
            on-timeout = "loginctl lock-session";
          }

          # Display off after 30 minutes
          {
            timeout = 1800;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }

          # Suspend after 60 minutes
          {
            timeout = 3600;
            on-timeout = "systemctl suspend";
          }

          # Hibernate after 60 minutes
          # {
          #   timeout = 3600;
          #   on-timeout = "systemctl hibernate";
          # }
        ];
      };
    };
  };
}
