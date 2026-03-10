{ inputs, pkgs, ... }:

{
  nixpkgs.overlays = [ inputs.niri.overlays.default ];

  environment.systemPackages = with pkgs; [
    niri
    xwayland-satellite
  ];
}
