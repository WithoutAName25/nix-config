{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "jb-laptop";
  system.stateVersion = "26.05"; # Do not change
}
