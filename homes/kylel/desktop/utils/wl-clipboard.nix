{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clipboard # CLI Copy/Paste Utility
  ];
}
