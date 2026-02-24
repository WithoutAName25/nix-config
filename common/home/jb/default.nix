{ ... }:

{
  imports = [
    ./programs
    ./impermanence.nix
    ./sops.nix
  ];

  home.stateVersion = "25.11";
}
