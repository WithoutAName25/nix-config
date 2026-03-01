{ ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      g = "git";
      n = "niri-session";
      v = "nvim";
      nix-shell = "nix-shell --command fish";
      nrs = "sudo nixos-rebuild switch --flake ~/nix#desktop";
    };

    shellInit = ''
      set fish_greeting
    '';
  };
}
