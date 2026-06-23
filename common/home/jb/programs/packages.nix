{ pkgs, ... }:

{
  home.packages = with pkgs; [
    discord-ptb
    fd
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.en_US
    kdePackages.ark
    libreoffice-fresh
    qimgv
    thunderbird
    webcord
    yubikey-manager
    yubioath-flutter
  ];
}
