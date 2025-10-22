''
  /* ── 1. Palette & Globals (Using @define-color) ──────────────────── */
  @define-color theme_fg rgba(78, 155, 167, 1); /* #4e9ba7; */
  @define-color theme_bg rgba(47, 48, 47, 0.7);
  @define-color theme_bg_opaque rgba(47, 48, 47, 1);
  @define-color border_dark rgba(78, 155, 167, 0.5);

  @define-color hover rgba(78, 155, 167, 0.3); /* @theme_fg, low opacity */

  @define-color warning rgba(255, 204, 0, 1); /* Yellow */
  @define-color critical rgba(204, 51, 0, 1); /* Red */

  @keyframes pulse {
    0% {
      color: @theme_fg;
    }

    50% {
      color: @warning;
    }

    100% {
      color: @theme_fg;
    }
  }

  /* ── Base Reset ───────────────────────────────────────────────────── */
  * {
    font-family: "FiraCode Nerd Font Propo";
    font-weight: bold;
    font-size: 14px; /* Font size changes height level automatically to fit (excluding top and bottom margins for individual elements) */
    color: @theme_fg;

    min-height: 20px;

    border-radius: 0;
    border: none;
    background: none;
    margin: 0;
    padding: 0;
    box-shadow: none;
    text-shadow: none;
    transition: none;
  }

  /* ── 2. Waybar Container ─────────────────────────────────── */
  #waybar {
    background: transparent;
  }
  window#waybar {
    background-color: @theme_bg;
    border-radius: 0px 0px 10px 10px;
  }

  tooltip {
    background-color: @theme_bg_opaque;
    border: 1.5px solid @border_dark;
    border-radius: 4px;
  }

  /* ── 3. Left Modules ─────────────────────────────────── */
  #custom-startmenu {
    font-size: 24px;
    margin-left: 4px;
    padding: 0px 4px;
    border: 1.5px solid transparent;
    border-radius: 25%;
  }
  #custom-startmenu:hover {
    border: 1.5px solid;

    transition: border 0.5s ease;
  }

  #taskbar {
    margin-left: 8px;
  }
  #taskbar button {
    margin-right: 8px;
    padding: 0px 1px;
    opacity: 0.5;

    border-right: 2px solid transparent;
    border-top: 2px solid transparent;
    border-left: 2px solid transparent;
  }
  #taskbar button.active,
  #taskbar button.active:active {
    border-top: 2px solid;

    opacity: 1;
    transition:
      border-bottom 0.5s ease,
      opacity 1s ease-in;
  }
  #taskbar button:hover {
    background-color: @hover;
    border-radius: 0px 0px 25% 25%;

    opacity: 1;
    transition:
      background-color 0.5s ease,
      opacity 0.5s ease;
  }

  /* ── 4. Center Modules ─────────────────────────────────── */
  #workspaces {
  }
  #workspaces button {
    padding: 0px 4px;
    opacity: 0.5;

    border-right: 2px solid transparent;
    border-top: 2px solid transparent;
    border-left: 2px solid transparent;
  }
  #workspaces button.active {
    border-top: 2px solid;

    opacity: 1;
    transition:
      border-top 0.5s ease,
      opacity 1s ease-in;
  }
  #workspaces button:hover {
    background-color: @hover;
    border-radius: 0px 0px 25% 25%;

    opacity: 1;
    transition: background-color 0.5s ease;
  }

  /* ── 5. Right Modules ─────────────────────────────────── */
  #tray {
    margin-right: 12px;
  }
  #tray > .passive,
  #tray > .active {
    border-top: 1.5px solid transparent;
  }
  #tray > .passive:hover,
  #tray > .active:hover {
    border-top: 1.5px solid;

    transition: border-top 0.5s ease;
  }
  #tray > .needs-attention {
    animation: pulse 2s infinite;
  }
  #tray menu {
    background-color: @theme_bg_opaque;
    border: 1.5px solid @border_dark;
    border-radius: 4px;
    padding: 10px 0px;
  }
  #tray menu menuitem:hover {
    background-color: @hover;
  }

  /* #pulseaudio { */
  /*   font-size: 16px; */
  /*   margin-right: 16px; */
  /* } */
  #clock {
    border-top: 1.5px solid transparent;
  }
  #clock:hover {
    border-top: 1.5px solid;

    transition: border-top 0.5s ease;
  }

  #custom-notification {
    font-size: 16px;
    padding: 0px 8px;
  }
  #custom-notification:hover {
    text-shadow:
      -1px -1px 0px black,
      1px -1px 0px black,
      -1px 1px 0px black,
      1px 1px 0px black;

    transition:
      text-shadow 0.5s ease,
      background-color 0.5s ease;
  }
''
