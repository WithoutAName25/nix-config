{ inputs, pkgs, ... }:

{
  nixpkgs.overlays = [ inputs.niri.overlays.default ];

  environment.systemPackages = with pkgs; [
    kdePackages.breeze
    xwayland-satellite
  ];

  programs.niri = {
    enable = true;
  };
}
