{ pkgs, ... }:

{
  home.packages = [
    (pkgs.kicad.override {
      addons = with pkgs.kicadAddons; [
        kikit
        kikit-library
      ];
    })
  ];
}
