{pkgs, ...}: {
  nix.settings.allowed-users = ["kylel"];

  users = {
    mutableUsers = true;

    users.kylel = {
      isNormalUser = true;
      description = "";
      extraGroups = [
        "adbusers"
        "docker"
        "input"
        "libvirtd"
        "lp"
        "networkmanager"
        "scanner"
        "wheel"
      ];

      shell = pkgs.zsh;
      ignoreShellProgramCheck = true;
    };
  };
}
