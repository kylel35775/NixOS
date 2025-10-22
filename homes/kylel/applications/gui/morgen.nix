{pkgs, ...}: {
  home.packages = with pkgs; [
    morgen
  ];
}
