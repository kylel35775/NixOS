{config, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        no_fade_in = true;
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

      # === Music Player ===
      image = [
        {
          size = 60;
          rounding = 5;
          border_size = 0;
          rotate = 0;
          reload_time = 2;
          reload_cmd = "playerctlock --arturl";
          position = "-150, -300";
          halign = "center";
          valign = "center";
          opacity = 0.5;
        }
      ];
      label = [
        # PLAYER TITLE
        {
          text = ''
            cmd[update:1000] echo "$(playerctlock --title)"
          '';
          color = "rgba(255, 255, 255, 0.8)";
          font_size = 14;
          font_family = "JetBrains Mono Nerd Font Mono";
          position = "880, -290";
          halign = "left";
          valign = "center";
        }
        # PLAYER TIMESTAMP
        {
          text = ''
            cmd[update:1000] echo "$(playerctlock --time)";
          '';
          color = "rgba(255, 255, 255, 1)";
          font_size = 12;
          font_family = "JetBrains Mono Nerd Font Mono";
          position = "-730, -310";
          halign = "right";
          valign = "center";
        }
        # PLAYER STATUS
        {
          text = ''
            cmd[update:1000] echo "$(playerctlock --status)"
          '';
          color = "rgba(255, 255, 255, 1)";
          font_size = 16;
          font_family = "JetBrains Mono Nerd Font Mono";
          position = "-740, -290";
          halign = "right";
          valign = "center";
        }
        # PLAYER SOURCE
        {
          text = ''
            cmd[update:1000] echo "$(playerctlock --source)"
          '';
          color = "rgba(255, 255, 255, 0.6)";
          font_size = 12;
          font_family = "JetBrains Mono Nerd Mono";
          position = "-740, -330";
          halign = "right";
          valign = "center";
        }
        # PLAYER ALBUM
        {
          text = ''
            cmd[update:1000] echo "$(playerctlock --album)"
          '';
          color = "rgba(255, 255, 255, 1)";
          font_size = 12;
          font_family = "JetBrains Mono Nerd Font Mono";
          position = "880, -330";
          halign = "left";
          valign = "center";
        }
        # PLAYER ARTIST
        {
          text = ''
            cmd[update:1000] echo "$(playerctlock --artist)"
          '';
          color = "rgba(255, 255, 255, 0.8)";
          font_size = 12;
          font_family = "JetBrains Mono Nerd Font Mono";
          position = "880, -310";
          halign = "left";
          valign = "center";
        }

        # === TIME ===
        # HOUR:MINUTE
        {
          text = ''
            cmd[update:1000] echo -e "$(date +"%H:%M")"
          '';
          color = "rgba(255, 255, 255, 1)";
          shadow_pass = 2;
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
          text = ''
            cmd[update:1000] echo -e "$(date +"%B %d, %A")"
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
          text = ''
            cmd[update:1000] echo "$(location) $(weather)"
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
          text = ''
            cmd[update:1000] echo -e "$(infonlock)"
          '';
          color = "rgba(255, 255, 255, 1)";
          font_size = 14;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "-20, -510";
          halign = "right";
          valign = "center";
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
