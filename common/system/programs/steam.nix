{ ... }:

{
  my.allowedUnfreePkgs = [
    "steam"
    "steam-unwrapped"
  ];

  programs.steam = {
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
