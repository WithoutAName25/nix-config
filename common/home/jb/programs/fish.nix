{ ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      cat = "bat";
      eza = "eza --git --group";
      g = "git";
      l = "eza -la";
      la = "eza -laa";
      ll = "eza -la";
      ls = "eza -l";
      n = "niri-session";
      nix-shell = "nix-shell --command fish";
      nrs = "sudo nixos-rebuild switch --flake ~/nix#desktop";
      v = "nvim";
    };

    shellInit = ''
      set fish_greeting
    '';
  };
}
