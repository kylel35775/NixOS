{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix/release-25.05";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    profile = "nvidia-laptop";
    host = "LenovoC940";
  in {
    nixosConfigurations = {
      amd = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;
          inherit profile;
          inherit host;
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
          inherit profile;
          inherit host;
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
          inherit profile;
          inherit host;
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
          inherit profile;
          inherit host;
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
          inherit profile;
          inherit host;
        };
        modules = [
          ./profiles/vm
          ./hosts/${host}
        ];
      };
    };
  };
}
