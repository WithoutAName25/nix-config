{ ... }:

{
  home.persistence."/persistent/cache" = {
    hideMounts = true;
    directories = [
      ".cache/huggingface"
      ".cache/spotify"
      ".cargo"
      ".gradle"
      ".platformio"
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
      ".config/discordcanary"
      ".config/discordptb"
      ".config/kdeconnect"
      ".config/Mattermost"
      ".config/Nextcloud"
      ".config/spotify"
      ".config/WebCord"
      ".config/zen/default"
      ".dotfiles" # old dotfiles
      ".local/share/containers"
      ".local/share/direnv"
      {
        directory = ".local/share/keyrings";
        mode = "0700";
      }
      ".local/share/Nextcloud"
      ".local/share/zoxide"
      ".local/state/syncthing"
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
    ];
  };
  home.persistence."/persistent/vault" = {
    hideMounts = true;
    directories = [
      ".local/share/gnupg"
      ".ssh"
      ".thunderbird"
    ];
    files = [
    ];
  };
}
