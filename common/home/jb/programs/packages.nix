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
    networkmanagerapplet
    qimgv
    thunderbird
    traceroute
    webcord
    wl-mirror
    yubikey-manager
    yubioath-flutter
  ];
}
