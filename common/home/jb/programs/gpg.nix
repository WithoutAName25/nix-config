{ config, pkgs, ... }:

{
  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
    settings = {
      keyid-format = "0xlong";
      with-fingerprint = true;
      with-subkey-fingerprint = true;

      personal-cipher-preferences = "AES256 AES192 AES";
      personal-digest-preferences = "SHA512 SHA384 SHA256";
      personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed";
      default-preference-list = "SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed";

      cert-digest-algo = "SHA512";
      weak-digest = "SHA1";
      keyserver-options = "no-honor-keyserver-url";

      s2k-cipher-algo = "AES256";
      s2k-digest-algo = "SHA512";
      s2k-count = "65011712";
    };

    scdaemonSettings = {
      disable-ccid = true;
    };
  };

  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-qt;
    enableFishIntegration = true;
    defaultCacheTtl = 3600;
    maxCacheTtl = 7200;
  };
}
