{ inputs, configName, ... }:

{
  imports = [
    ./config
    ./programs
    ./services
    ./impermanence.nix
    ./sops.nix
    inputs.private.homeManagerModules.default.jb
    inputs.private.homeManagerModules.${configName}.jb
    ../../../hosts/${configName}/home/jb
  ];

  home.stateVersion = "25.11";
}
