{ ... }:

{
  home.persistence."/persistent/cache" = {
    hideMounts = true;
    directories = [
      ".cache/spotify"
      ".cargo"
      ".local/share/Steam"
      ".platformio"
      ".steam"
    ];
    files = [
    ];
  };
  home.persistence."/persistent/data" = {
    hideMounts = true;
    directories = [
      ".claude"
      ".config/DankMaterialShell"
      ".config/discord"
      ".config/discordptb"
      ".config/kdeconnect"
      ".config/Nextcloud"
      ".config/spotify"
      ".config/WebCord"
      ".config/zen/default"
      ".dotfiles" # old dotfiles
      ".local/share/direnv"
      {
        directory = ".local/share/keyrings";
        mode = "0700";
      }
      ".local/share/Nextcloud"
      ".local/share/Steam-userdata"
      ".local/share/zoxide"
      ".pki/nssdb"
      "Arduino"
      "Documents"
      "nix"
      "nix-private"
      "Notizen"
      "persistent"
      "Pictures"
      "Projects"
      "Videos"
    ];
    files = [
      ".claude.json"
      ".local/share/fish/fish_history"
      ".ssh/known_hosts"
    ];
  };
  home.persistence."/persistent/vault" = {
    hideMounts = true;
    directories = [
      ".thunderbird"
    ];
    files = [
    ];
  };
}
