{ ... }:

{
  imports = [
    ./config
    ./programs
    ./services
    ./impermanence.nix
    ./sops.nix
  ];

  home.stateVersion = "25.11";
}
