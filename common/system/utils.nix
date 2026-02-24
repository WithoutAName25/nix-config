{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    age
    sops
    neovim
    nixfmt
    usbutils
  ];
}
