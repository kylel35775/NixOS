{host, ...}: let
  inherit (import ../../hosts/${host}/system-variables.nix) intelID nvidiaID;
in {
  imports = [
    ../drivers
  ];

  # Enable GPU Drivers
  drivers = {
    intel.enable = false;

    amdgpu.enable = false;
    nvidia.enable = true;
    nvidia-prime = {
      enable = true;
      intelBusID = "${intelID}";
      nvidiaBusID = "${nvidiaID}";
    };
  };
  vm.guest-services.enable = false;
}
