{ ... }:

{
  home.persistence."/persistent" = {
    directories = [
      ".config/DankMaterialShell"
      "nix"
    ];
    files = [
      ".local/share/fish/fish_history"
      ".ssh/known_hosts"
    ];
  };
}
