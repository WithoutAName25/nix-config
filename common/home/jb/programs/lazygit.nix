{ ... }:

{
  programs.lazygit = {
    enable = true;
    enableFishIntegration = false;

    settings = {
      git = {
        autoFetch = false;
      };
    };
  };
}
