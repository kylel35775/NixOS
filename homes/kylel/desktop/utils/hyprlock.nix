{config, ...}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        grace = 3;
        disable_loading_bar = false;
        hide_cursor = true;
        ignore_empty_input = true;
        text_trim = true;
      };

      background = [
        {
          path = "${config.home.homeDirectory}/Pictures/Wallpapers/nix-wallpaper-stripes-logo.png";
          blur_passes = 1;
          blur_size = 2;
        }
      ];

      # ===== NOTE: Positioning configs assume 25px screen margin

      # === Music Player ===
      image = [
        {
          size = 150;
          rounding = 5;
          border_size = 0;
          rotate = 0;
          reload_time = 2;
          reload_cmd = "playerctlock --arturl";
          position = "25px, 25px"; # (X, Y) coordinates, positioning is relative to halign and valign settings
          halign = "left"; # Positioning relative to bottom left of screen
          valign = "bottom";
        }
      ];
      label = [
        {
          text = ''
            cmd[update:1000] echo "$(playerctlock)"
          '';
          color = "rgba(255, 255, 255, 1)";
          font_size = 18;
          font_family = "JetBrains Mono Nerd Font Mono";
          position = "185px, 150px";
          halign = "left";
          valign = "bottom";
        }
        # PLAYER TITLE
        # {
        #   text = ''
        #     cmd[update:1000] echo "$(playerctlock --title)"
        #   '';
        #   color = "rgba(255, 255, 255, 0.8)";
        #   font_size = 18;
        #   font_family = "JetBrains Mono Nerd Font Mono";
        #   position = "185px, 155px";
        #   halign = "left";
        #   valign = "bottom";
        # }
        # # PLAYER ALBUM
        # {
        #   text = ''
        #     cmd[update:1000] echo "$(playerctlock --album)"
        #   '';
        #   color = "rgba(255, 255, 255, 1)";
        #   font_size = 18;
        #   font_family = "JetBrains Mono Nerd Font Mono";
        #   position = "185px, 135px";
        #   halign = "left";
        #   valign = "bottom";
        # }
        # # PLAYER ARTIST
        # {
        #   text = ''
        #     cmd[update:1000] echo "$(playerctlock --artist)"
        #   '';
        #   color = "rgba(255, 255, 255, 0.8)";
        #   font_size = 18;
        #   font_family = "JetBrains Mono Nerd Font Mono";
        #   position = "185px, 115px";
        #   halign = "left";
        #   valign = "bottom";
        # }
        # # PLAYER TIMESTAMP
        # {
        #   text = ''
        #     cmd[update:1000] echo "$(playerctlock --time)";
        #   '';
        #   color = "rgba(255, 255, 255, 1)";
        #   font_size = 18;
        #   font_family = "JetBrains Mono Nerd Font Mono";
        #   position = "210px, 75px";
        #   halign = "left";
        #   valign = "bottom";
        # }
        # # PLAYER STATUS
        # {
        #   text = ''
        #     cmd[update:1000] echo "$(playerctlock --status)"
        #   '';
        #   color = "rgba(255, 255, 255, 1)";
        #   font_size = 18;
        #   font_family = "JetBrains Mono Nerd Font Mono";
        #   position = "185px, 75px";
        #   halign = "left";
        #   valign = "bottom";
        # }
        # # PLAYER SOURCE
        # {
        #   text = ''
        #     cmd[update:60000] echo "$(playerctlock --source)"
        #   '';
        #   color = "rgba(255, 255, 255, 0.6)";
        #   font_size = 16;
        #   font_family = "JetBrains Mono Nerd Mono";
        #   position = "600px, 25px";
        #   halign = "left";
        #   valign = "bottom";
        # }

        # === TIME ===
        # HOUR:MINUTE
        {
          # Update every minute (60000 ms)
          #text = ''
          #  cmd[update:60000] echo -e "$(date +"%H:%M")"
          #'';
          text = "$TIME";
          color = "rgba(255, 255, 255, 1)";
          shadow_passes = 2;
          shadow_size = 3;
          shadow_color = "rgb(0, 0, 0)";
          shadow_boost = 1.2;
          font_size = 124;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "0, -250";
          halign = "center";
          valign = "top";
        }
        # DATE
        {
          # Update every minute (60000 ms)
          text = ''
            cmd[update:60000] echo -e "$(date +"%B %d, %A")"
          '';
          color = "rgba(255, 255, 255, 1)";
          font_size = 26;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "0, -130";
          halign = "center";
          valign = "center";
        }

        # === LOCATION/WEATHER ===
        {
          # Update every 15 minutes (900000 ms)
          text = ''
            cmd[update:900000] echo "$(location) $(weather)"
          '';
          color = "rgba(255, 255, 255, 1)";
          font_size = 14;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "0, 465";
          halign = "center";
          valign = "center";
        }

        # === BATTERY ===
        {
          # Update every minute (60000 ms)
          text = ''
            cmd[update:60000] echo -e "$(infonlock)"
          '';
          color = "rgba(255, 255, 255, 1)";
          font_size = 14;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "-25px, 25px";
          halign = "right";
          valign = "bottom";
        }
      ];

      # PASSWORD INPUT
      input-field = [
        {
          size = "250, 60";
          outline_thickness = 0;
          outer_color = "rgb(0D0E15)";
          dots_center = true;
          inner_color = "rgb(657DC2)";
          font_color = "rgb(CFE6F4)";
          fade_on_empty = false;
          font_family = "JetBrains Mono Nerd Font Mono";
          placeholder_text = " $USER";
          position = "0, -470";
          halign = "center";
          valign = "center";
          zindex = 10;
        }
      ];
    };
  };
}
