{pkgs, ...}: {
  # Allows user-selected power profiles handling available over D-BUS
  services.power-profiles-daemon.enable = true;

  environment.systemPackages = with pkgs; [
    powerjoular # Power Monitoring for CPU/GPU
    powertop # Power Monitor
  ];

  powerManagement = {
    enable = true; # Enable suspend-to-RAM and power saving

    powertop = {
      enable = true; # Enable powertop auto tuning

      # Disable automatic tuning for front panel USB-A (Corsair Headset)
      postStart = ''
        echo 'on' > /sys/bus/usb/devices/1-4/power/control
      '';
    };
  };
}
