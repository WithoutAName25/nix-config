{ ... }:

{
  imports = [
    ./programs
    ./services
    ./boot.nix
    ./impermanence.nix
    ./locale.nix
    ./network.nix
    ./users.nix
    ./utils.nix
    ./virtualisation.nix
  ];
}
