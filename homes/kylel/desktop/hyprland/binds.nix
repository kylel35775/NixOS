let
  inherit (import ../../user-variables.nix) browser terminal;
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Apps
      "$modifier, Return, exec, ${terminal}"
      "$modifier SHIFT, Return, exec, rofi-launcher"
      "$modifier SHIFT, N, exec, swaync-client -rs"
      "$modifier SHIFT, S, exec, flameshot-gui"
      "$modifier, B, exec,${browser}"
      "$modifier, Y, exec, kitty -e yazi"
      "$modifier, E, exec, emoji-picker"
      "$modifier, D, exec, vesktop"
      "$modifier, C, exec, hyprpicker -a"
      "$modifier, M, exec, pavucontrol"
      "$modifier, V, exec, kitty --class clipse --single-instance -e clipse"
      "$modifier, W, exec, kitty --class wallrizz --single-instance -o allow_remote_control=yes -e WallRizz --disable-notification --preview-mode list"

      # Window
      "$modifier, Q, killactive,"
      "$modifier SHIFT, Q, forcekillactive"
      "$modifier SHIFT, I, togglesplit,"
      "$modifier, F, fullscreen,"
      "$modifier SHIFT, F, togglefloating,"
      "$modifier ALT, F,workspaceopt, allfloat"
      "$modifier SHIFT, P, togglefloating,"
      "$modifier SHIFT, P, pin,"
      "$modifier SHIFT, C, exit,"
      "$modifier SHIFT, left, movewindow,l"
      "$modifier SHIFT, right, movewindow,r"
      "$modifier SHIFT, up, movewindow,u"
      "$modifier SHIFT, down, movewindow,d"
      "$modifier SHIFT, h, movewindow,l"
      "$modifier SHIFT, l, movewindow,r"
      "$modifier SHIFT, k, movewindow,u"
      "$modifier SHIFT, j, movewindow,d"
      "$modifier ALT, left, swapwindow,l"
      "$modifier ALT, right, swapwindow,r"
      "$modifier ALT, up, swapwindow,u"
      "$modifier ALT, down, swapwindow,d"
      "$modifier ALT, 43, swapwindow,l"
      "$modifier ALT, 46, swapwindow,r"
      "$modifier ALT, 45, swapwindow,u"
      "$modifier ALT, 44, swapwindow,d"

      # Focus
      "$modifier, left, movefocus,l"
      "$modifier, right, movefocus,r"
      "$modifier, up, movefocus,u"
      "$modifier, down, movefocus,d"
      "$modifier, h, movefocus,l"
      "$modifier, l, movefocus,r"
      "$modifier, k, movefocus,u"
      "$modifier, j, movefocus,d"

      # Cycle Focus
      "ALT, Tab, cyclenext"
      "ALT, Tab, bringactivetotop"

      # Workspace
      "$modifier, 1, workspace,1"
      "$modifier, 2, workspace,2"
      "$modifier, 3, workspace,3"
      "$modifier, 4, workspace,4"
      "$modifier, 5, workspace,5"
      "$modifier, 6, workspace,6"
      "$modifier, 7, workspace,7"
      "$modifier, 8, workspace,8"
      "$modifier, 9, workspace,9"
      "$modifier, 0, workspace,10"
      "$modifier SHIFT, SPACE, movetoworkspace,special"
      "$modifier, SPACE, togglespecialworkspace"
      "$modifier SHIFT, 1, movetoworkspace,1"
      "$modifier SHIFT, 2, movetoworkspace,2"
      "$modifier SHIFT, 3, movetoworkspace,3"
      "$modifier SHIFT, 4, movetoworkspace,4"
      "$modifier SHIFT, 5, movetoworkspace,5"
      "$modifier SHIFT, 6, movetoworkspace,6"
      "$modifier SHIFT, 7, movetoworkspace,7"
      "$modifier SHIFT, 8, movetoworkspace,8"
      "$modifier SHIFT, 9, movetoworkspace,9"
      "$modifier SHIFT, 0, movetoworkspace,10"
      "$modifier CONTROL, right, workspace,e+1"
      "$modifier CONTROL, left, workspace,e-1"
      "$modifier, mouse_down, workspace, e+1"
      "$modifier, mouse_up, workspace, e-1"

      # Function keys
      ", Print, exec, flameshot screen"
      # ",XF86PowerOff"
    ];

    # bind[l] - Allow keybinds to bypass lock screen
    bindl = [
      ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume=raise"
      ", XF86AudioLowerVolume, exec, swayosd-client --output-volume=lower"
      ", XF86AudioMute, exec, swayosd-client --output-volume=mute-toggle"
      ", XF86AudioMicMute, exec, swayosd-client --input-volume=mute-toggle"

      ", XF86AudioPlay, exec, swayosd-client --playerctl=play-pause"
      ", XF86AudioPause, exec, swayosd-client --playerctl=play-pause"
      ", XF86AudioStop, exec, swayosd-client --playerctl=stop"
      ", XF86AudioPrev, exec, swayosd-client --playerctl=prev"
      ", XF86AudioNext, exec, swayosd-client --playerctl=next"

      ", XF86MonBrightnessUp, exec, swayosd-client --brightness=raise"
      ", XF86MonBrightnessDown, exec, swayosd-client --brightness=lower"

      ", caps_lock, exec, swayosd-client --caps-lock"
    ];

    # bind[m] - Mouse keybinds
    bindm = [
      "$modifier, mouse:272, movewindow"
      "$modifier, mouse:273, resizewindow"
    ];
  };
}
