{ inputs, configName, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  my.allowedUnfreePkgs = [
    "claude-code"
    "discord"
    "spotify"
  ];

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
