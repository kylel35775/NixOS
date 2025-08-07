let
  paths = [
    "/home"
  ];

  exclude = [
    "/home/*/.cache"
    "/home/*/.config"
    "/home/*/.gnupg"
    "/home/*/.hplip"
    "/home/*/.icons"
    "/home/*/.local"
    "/home/*/.nix-defexpr"
    "/home/*/.nix-profile"
    "/home/*/.nv"
    "/home/*/.pki"
    "/home/*/.ssh"
    "/home/*/.steam"
    "/home/*/.zsh"
    "/home/*/Games"
  ];

  repoName = "NixStation-Backups";
in {
  services.restic = {
    backups = {
      localbackup = {
        inherit paths;
        inherit exclude;

        repository = "/mnt/Seagate 2TB HDD/Backups/${repoName}";
        initialize = true; # Initiliaze Repo
        passwordFile = "/etc/nixos/secrets/restic-password";
      };

      OneDrive = {
        inherit paths;
        inherit exclude;

        rcloneConfigFile = "/etc/nixos/secrets/rclone-OneDrive";

        repository = "remote:Backups/${repoName}";
        initialize = true;
        passwordFile = "/etc/nixos/secrets/restic-password";
      };
    };
  };
}
