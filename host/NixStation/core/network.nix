{
  pkgs,
  host,
  options,
  ...
}: {
  environment.systemPackages = with pkgs; [networkmanagerapplet];

  networking = {
    networkmanager.enable = true;
    hostName = "${host}";
    timeServers = options.networking.timeServers.default ++ ["pool.ntp.org"];

    firewall = {
      enable = false;

      allowedTCPPorts = [
        22
        80
        443
        59010
        59011
        8080
      ];
      allowedUDPPorts = [
        59010
        59011
      ];
    };
  };
}
