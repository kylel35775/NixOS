''
  /* ── 1. Palette & Globals (Using @define-color) ──────────────────── */
  @define-color theme_fg #4e9ba7;
  @define-color theme_bg rgba(47, 48, 47, 0.7);
  @define-color theme_bg_opaque rgba(47, 48, 47, 1);
  @define-color border_dark rgba(78, 155, 167, 0.5);
  @define-color warning rgba(255, 204, 0, 1);
  @define-color critical rgba(204, 51, 0, 1);

  /* ── Base Reset ───────────────────────────────────────────────────── */
  * {
    font-family: "JetBrainsMono Nerd Font Propo";
    font-weight: bold;
    font-size: 14px; /* Font size changes height level automatically to fit (excluding top and bottom margins for individual elements) */
    color: @theme_fg;

    border-radius: 0;
    border: none;
    background: none;
    margin: 0;
    padding: 0;
    box-shadow: none;
    text-shadow: none;
    outline: none;
    transition: none;

    min-height: 20px;
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
  tooltip label {
  }

  /* ── 3. Left Modules ─────────────────────────────────── */
  #custom-startmenu {
    font-size: 24px;
    margin: 0px 0px 0px 8px;
  }

  #taskbar {
    margin: 0px 0px 0px 8px;
  }
  #taskbar button {
    margin: 0px 0px 0px 12px;
  }
  #taskbar button.active {
    border-bottom: 2.5px solid;
    opacity: 1;
  }
  #taskbar button:hover {
    background-color: @theme_fg;
    color: @theme_bg;
  }

  /* ── 4. Center Modules ─────────────────────────────────── */
  #workspaces {
  }
  #workspaces button {
    padding: 5px;
    opacity: 0.6;
  }
  #workspaces button.active {
    border-bottom: 2.5px solid;
    opacity: 1;
  }
  #workspaces button:hover {
    background-color: @theme_fg;
    color: @theme_bg;
    opacity: 1;
  }
  #workspaces button:hover label {
    color: @theme_bg;
    opacity: 1;
  }

  /* ── 5. Right Modules ─────────────────────────────────── */
  #tray {
    margin: 0px 16px 0px 0px;
  }
  #tray menu {
    background-color: @theme_bg_opaque;
    border: 1.5px solid @border_dark;
    border-radius: 4px;
    padding: 10px 0px 10px 0px;
  }

  #pulseaudio {
    font-size: 16px;
    margin: 0px 16px 0px 0px;
  }

  #battery {
    font-size: 16px;
    margin: 0px 16px 0px 0px;
  }
  #battery.warning {
    color: @warning;
  }
  #battery.critical {
    color: @critical;
  }

  #clock {
    margin: 0px 8px 0px 0px;
  }

  #custom-notification {
    font-size: 16px;
    margin: 0px 8px 0px 0px;
  }
''
