{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "jb-desktop";
  system.stateVersion = "26.05"; # Do not change
}
