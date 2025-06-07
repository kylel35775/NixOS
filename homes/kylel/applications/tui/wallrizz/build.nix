{pkgs ? import <nixpkgs> {}}: {
  WallRizz = pkgs.callPackage ./derivation.nix {};
}
