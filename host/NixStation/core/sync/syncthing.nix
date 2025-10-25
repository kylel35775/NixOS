let
  user = "kylel";
in {
  services.syncthing = {
    enable = true;
    openDefaultPorts = true; # TCP/UDP 22000 for transfers and UDP 21027 for discovery
    guiAddress = "127.0.0.1:8384";

    inherit user;
    dataDir = "/home/${user}/Syncthing";
    configDir = "/home/${user}/.config/syncthing";

    overrideDevices = true; # Delete devices not configured in 'settings.devices.<>'
    overrideFolders = false; # Keep manually created folders
    settings = {
      options.urAccepted = -1; # Reject anonymous data collection

      devices = {
        C-PF5YSYJH = {
          id = "DDQXX3Y-BAC6ADL-OKA7IED-MH4AWL4-JGQQ7FY-ITWJLTX-ZYWNLLT-FHF3CAY";
          autoAcceptFolders = true;
        };

        LenovoC940 = {
          id = "5EU3VZC-MGG4SIT-3TZ5YNT-CALZDDJ-YBXPILT-YA5DE4N-K4FECM6-HDYRAAF";
          autoAcceptFolders = true;
        };

        Pixel9a = {
          id = "TABHFLR-US7QC5H-XIE4PZN-RX5PIMN-QNMW3FJ-HL5QN5U-VHSP5NI-IIMXTQQ";
          autoAcceptFolders = true;
        };
      };

      folders = {
        "~/Syncthing/Sync" = {
          label = "Sync"; # How Syncthing displays shared folder name
          id = "Sync"; # How the folder is named on other devices' filesystems

          devices = [
            "LenovoC940"
            "Pixel9a"
          ];
        };
      };
    };
  };
}
