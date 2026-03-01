{ ... }:

{
  home.persistence."/persistent/cache" = {
    hideMounts = true;
    directories = [
      ".cache/spotify"
    ];
    files = [
    ];
  };
  home.persistence."/persistent/data" = {
    hideMounts = true;
    directories = [
      ".config/DankMaterialShell"
      ".config/discord"
      ".config/spotify"
      ".config/zen/default"
      ".local/share/zoxide"
      "nix"
    ];
    files = [
      ".local/share/fish/fish_history"
      ".ssh/known_hosts"
    ];
  };
  home.persistence."/persistent/vault" = {
    hideMounts = true;
    directories = [
    ];
    files = [
    ];
  };
}
