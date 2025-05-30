{
  inputs,
  profile,
  host,
  ...
}: {
  users.mutableUsers = true;

  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = false;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs host profile;};
  };
}
