{
  fileSystems."/mnt/Seagate 2TB HDD" = {
    device = "/dev/disk/by-uuid/C62E4AD42E4ABCE5";
    fsType = "ntfs";

    options = [
      "defaults"
      "nofail"
      "rw"
      "x-gvfs-show"
    ];
  };
}
