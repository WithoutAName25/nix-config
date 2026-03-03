{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fd
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.en_US
    libreoffice-fresh
  ];
}
