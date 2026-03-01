{ ... }:

{
  home.persistence."/persistent" = {
    directories = [
      ".config/DankMaterialShell"
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
