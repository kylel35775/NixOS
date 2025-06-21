{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-unstable = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # nvf = {
    #   url = "github:notashelf/nvf/";
    #   inputs.nixpkgs.follows = "nixpkgs-unstable";
    # };
    nvf = {
      url = "github:notashelf/nvf?ref=pull/956/merge";
    };
    stylix.url = "github:danth/stylix/release-25.05";
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    profile = "nvidia";
    host = "NixStation";
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname' OR 'nh os build --hostname your-hostname'
    nixosConfigurations = {
      nvidia = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs profile host;};

        modules = [
          ./profiles/nvidia
          ./host/${host}
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname' OR 'nh home build --configuration your-username@your-host'
    # user@host need not be specified once user+host is established, as home-manager will select the current user@host
    homeConfigurations = let
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in {
      "kylel@${host}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs pkgs-unstable profile host;};

        modules = [./homes/kylel];
      };
    };
  };
}
