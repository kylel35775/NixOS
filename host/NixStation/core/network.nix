{
  host,
  options,
  ...
}: {
  # System tray indicator for NetworkManager
  programs.nm-applet = {
    enable = false;
    indicator = true;
  };

  networking = {
    networkmanager.enable = true;
    hostName = "${host}";
    timeServers = options.networking.timeServers.default ++ ["pool.ntp.org"];

    firewall = {
      enable = true;

      allowedTCPPorts = [
        22
        80
        443
        59010
        59011
        8080

        8008 # Chromecast
        8009 # Chromecast

        8384 # Syncthing

        42420 # Vintage Story Server
      ];
      allowedTCPPortRanges = [
        {
          from = 27015; # Steam Client Server Connection
          to = 27050;   #
        }
      ];
      allowedUDPPorts = [
        59010
        59011

        5353 # Chromecast Discovery

        8384 # Syncthing

        3478 # Steam P2P Networking and Steam Voice Chromecast
        4379 # 
        4380 # 

        35510 #
        35520 #
        35530 # Darktide
        35540 #
        35550 #
        35560 #
        35570 #
        35580 #
        35590 #
        35600 #
        35610 #
        35620 #
        35630 #
        35640 #
        35650 #

        42420 # Vintage Story Server
      ];
      allowedUDPPortRanges = [
        {
          from = 27000; # Steam Client Game Traffic
          to = 27100;   #
        }
      ];
    };
  };
}
