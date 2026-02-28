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

  programs.btop = {
    enable = true;

    settings = {
      cpu_single_graph = true;
      update_ms = 1000;
    };
  };

  programs.zoxide = {
    enable = true;

    options = [
      "--cmd"
      "cd"
    ];

    enableFishIntegration = true;
  };
}
