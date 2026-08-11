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
  ];

  home.stateVersion = "25.11";
}
