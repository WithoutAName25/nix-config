{ inputs, configName, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users = {
      jb = import ./jb;
    };

    extraSpecialArgs = {
      inherit inputs configName;
    };
  };
}
