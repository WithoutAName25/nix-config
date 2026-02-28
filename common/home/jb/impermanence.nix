{ ... }:

{
  home.persistence."/persistent" = {
    directories = [
      ".config/DankMaterialShell"
      ".local/share/zoxide"
      "nix"
    ];
    files = [
      ".local/share/fish/fish_history"
      ".ssh/known_hosts"
    ];
  };
}
