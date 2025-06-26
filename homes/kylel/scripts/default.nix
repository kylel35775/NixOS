{pkgs, ...}: {
  home.packages = [
    (import ./emoji-picker.nix {inherit pkgs;})
    (import ./flameshot-gui.nix {inherit pkgs;})
    (import ./hm-find.nix {inherit pkgs;})
    (import ./keybinds.nix {inherit pkgs;})
    (import ./nvidia-offload.nix {inherit pkgs;})
    (import ./nvim-launcher.nix {inherit pkgs;})
    (import ./playerctlock.nix {inherit pkgs;})
    (import ./rofi-launcher.nix {inherit pkgs;})
    (import ./task-waybar.nix {inherit pkgs;})
    (import ./wallsetter.nix {inherit pkgs;})
    (import ./yt-music.nix {inherit pkgs;})
  ];
}
