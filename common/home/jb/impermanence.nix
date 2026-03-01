{ ... }:

{
  home.persistence."/persistent" = {
    directories = [
      ".cache/spotify"
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
}
