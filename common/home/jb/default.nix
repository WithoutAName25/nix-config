{ inputs, ... }:

{
  imports = [
    ./config
    ./programs
    ./services
    ./impermanence.nix
    ./sops.nix
    inputs.private.homeManagerModules.jb
  ];

  home.stateVersion = "25.11";
}
