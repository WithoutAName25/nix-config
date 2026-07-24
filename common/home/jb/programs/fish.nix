{ ... }:

{
  programs.fish = {
    enable = true;

    functions = {
      o = {
        body = ''
          ob $argv
          exit
        '';
        wraps = "xdg-open";
        description = "Open a file with the default application and close the shell";
      };
      ob = {
        body = "setsid xdg-open $argv &>/dev/null";
        wraps = "xdg-open";
        description = "Open a file with the default application detached from the shell";
      };
    };

    shellAliases = {
      cat = "bat";
      eza = "eza --git --group";
      g = "git";
      lg = "lazygit";
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
