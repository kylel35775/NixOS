{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    powerjoular # Power Monitoring for CPU/GPU
    powermode-indicator # System Tray Indicator for Changing Power Mode
    powertop # Power Monitor
  ];

  powerManagement = {
    enable = true; # Enable suspend-to-RAM and power saving
    powertop.enable = true; # Enable powertop auto tuning
  };

  # Allows user-selected power profiles handling available over D-BUS
  services.power-profiles-daemon = {
    enable = true;
    package = pkgs.power-profiles-daemon;
  };
}
