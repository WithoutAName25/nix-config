{ inputs, pkgs, ... }:

{
  nixpkgs.overlays = [ inputs.niri.overlays.default ];

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

  programs.niri = {
    enable = true;
  };
}
