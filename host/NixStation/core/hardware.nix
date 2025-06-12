{pkgs, ...}: {
  local.hardware-clock.enable = false;

  hardware = {
    graphics.enable = true;
    enableRedistributableFirmware = true;
    keyboard.qmk.enable = true;
    i2c.enable = true;

    sane = {
      enable = true;
      extraBackends = [pkgs.sane-airscan];
      disabledDefaultBackends = ["escl"];
    };

    logitech = {
      wireless.enable = false;
      wireless.enableGraphical = false;
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
