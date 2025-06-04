{pkgs, ...}: {
  home.packages = [
    (import ./emopicker9000.nix {inherit pkgs;})
    (import ./infonlock.nix {inherit pkgs;})
    (import ./hm-find.nix {inherit pkgs;})
    (import ./keybinds.nix {inherit pkgs;})
    (import ./nvidia-offload.nix {inherit pkgs;})
    (import ./playerctlock.nix {inherit pkgs;})
    (import ./rofi-launcher.nix {inherit pkgs;})
    (import ./task-waybar.nix {inherit pkgs;})
    (import ./wallsetter.nix {inherit pkgs;})
    (import ./yt-music.nix {inherit pkgs;})
  ];
}
