{ ... }:

{
  home.persistence."/persistent" = {
    directories = [ "nix" ];
    files = [ ".local/share/fish/fish_history" ];
  };
}
