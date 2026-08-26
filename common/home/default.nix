{ inputs, configName, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  my.allowedUnfreePkgs = [
    "claude-code"
    "discord"
    "discord-canary"
    "discord-ptb"
    "discord-unwrapped"
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
