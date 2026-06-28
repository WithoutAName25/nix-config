{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bind.dnsutils
    discord-ptb
    fd
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.en_US
    kdePackages.ark
    knot-dns
    libreoffice-fresh
    libqalculate
    qimgv
    thunderbird
    traceroute
    webcord
    yubikey-manager
    yubioath-flutter
  ];
}
