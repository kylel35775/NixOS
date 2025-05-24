{pkgs, ...}: {
  programs = {
    firefox.enable = false; # Firefox is not installed by default
    hyprland.enable = true; #someone forgot to set this so desktop file is created
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    adb.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    amfora # Fancy Terminal Browser For Gemini Protocol
    appimage-run # Needed For AppImage Support
    bc # GNU Software Calculator
    beets # CLI Music Tagger and Library Organizer
    binsider # TUI Binary Analyzer
    brave # Brave Browser
    brightnessctl # For Screen Brightness Control
    discord # Electron Based Social Messager
    docker-compose # Allows Controlling Docker From A Single File
    duf # Utility For Viewing Disk Usage In Terminal
    eza # Beautiful ls Replacement
    ffmpeg # Terminal Video / Audio Editing
    file-roller # Archive Manager
    gedit # Simple Graphical Text Editor
    gitui # TUI For Git Version Control
    glxinfo # Needed for inxi diag util
    greetd.tuigreet # The Login Manager (Sometimes Referred To As Display Manager)
    htop # Simple Terminal Based System Monitor
    eog # For Image Viewing
    inxi # CLI System Information Tool
    keepassxc # Offline Password Manager
    killall # For Killing All Instances Of Programs
    libnotify # For Notifications
    lm_sensors # Used For Getting Hardware Temps
    lshw # Detailed Hardware Information
    mpv # Incredible Video Player
    ncdu # Disk Usage Analyzer With Ncurses Interface
    nodejs
    nixfmt-rfc-style # Nix Formatter
    nwg-displays #configure monitor configs via GUI
    obs-studio # Desktop Recording Software
    pavucontrol # For Editing Audio Levels & Devices
    pciutils # Collection Of Tools For Inspecting PCI Devices
    pkg-config # Wrapper Script For Allowing Packages To Get Info On Others
    playerctl # Allows Changing Media Volume Through Scripts
    rhythmbox # Music Player
    ripgrep # Improved Grep
    socat # Needed For Screenshots
    steamcmd # CLI for Steam
    sysz # Systemctl TUI
    termscp # TUI Terminal File Transfer/Explorer (SCP/SFTP/FTP/Kube/S3/WebDAV)
    unrar # Tool For Handling .rar Files
    unzip # Tool For Handling .zip Files
    usbutils # Good Tools For USB Devices
    v4l-utils # Used For Things Like OBS Virtual Camera
    vivaldi # Chromium Based Browser with Ad/Tracker Blocker
    wev # Wayland Event Viewer
    wget # Tool For Fetching Files With Links
    yazi # TUI File Manager
    yt-dlp # Tool For Downloading Internet Media from YouTube, SoundCloud, etc.
    yubioath-flutter # Yubico Authenticator
  ];
}
