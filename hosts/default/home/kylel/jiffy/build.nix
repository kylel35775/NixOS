{pkgs ? import <nixpkgs> {}}: {
  jiffy = pkgs.callPackage ./derivation.nix {};
}
