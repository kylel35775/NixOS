{pkgs, ...}: let
  inherit (import ../system-variables.nix) printEnable;
in {
  environment.systemPackages = with pkgs; [
    hplip
  ];

  services = {
    ipp-usb.enable = printEnable;

    printing = {
      enable = printEnable;
      drivers = [
        pkgs.hplipWithPlugin
      ];
    };

    avahi = {
      enable = printEnable;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
