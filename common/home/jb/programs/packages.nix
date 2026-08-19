{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bind.dnsutils
    chromium
    discord
    # discord-canary
    # discord-ptb
    fd
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.en_US
    kdePackages.ark
    knot-dns
    libreoffice-fresh
    libqalculate
    mattermost-desktop
    qimgv
    thunderbird
    traceroute
    webcord
    yubikey-manager
    yubioath-flutter
  ];
}
