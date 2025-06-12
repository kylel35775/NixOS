{pkgs, ...}: let
  inherit (import ../system-variables.nix) thunarEnable;
in {
  environment.systemPackages = with pkgs; [
    ffmpegthumbnailer # Need For Video / Image Preview
  ];

  programs.thunar = {
    enable = thunarEnable;

    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
}
