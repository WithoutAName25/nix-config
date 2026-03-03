{ ... }:

{
  imports = [
    ./programs
    ./services
    ./boot.nix
    ./impermanence.nix
    ./locale.nix
    ./network.nix
    ./swap.nix
    ./users.nix
    ./utils.nix
    ./virtualisation.nix
  ];
}
