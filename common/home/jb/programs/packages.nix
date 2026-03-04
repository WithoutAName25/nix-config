{ pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    fd
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.en_US
    kdePackages.ark
    libreoffice-fresh
    thunderbird
  ];
}
