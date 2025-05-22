{
  description = "NixOS";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    host = "LenovoC940";
    profile = "nvidia-laptop";
  in {
    nixosConfigurations = {
      amd = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit host;
          inherit profile;
        };
        modules = [
          ./profiles/amd
          ./hosts/${host}
        ];
      };
      nvidia = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit host;
          inherit profile;
        };
        modules = [
          ./profiles/nvidia
          ./hosts/${host}
        ];
      };
      nvidia-laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit host;
          inherit profile;
        };
        modules = [
          ./profiles/nvidia-laptop
          ./hosts/${host}
        ];
      };
      intel = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit host;
          inherit profile;
        };
        modules = [
          ./profiles/intel
          ./hosts/${host}
        ];
      };
      vm = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit host;
          inherit profile;
        };
        modules = [
          ./profiles/vm
          ./hosts/${host}
        ];
      };
    };
  };
}
