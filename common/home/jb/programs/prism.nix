{ config, pkgs, ... }:

{
  programs.prismlauncher = {
    enable = true;
    package = pkgs.prismlauncher.override {
      additionalLibs = [ pkgs.glfw3-minecraft ];
    };
  };

  home.file.".local/share/PrismLauncher".source =
    config.lib.file.mkOutOfStoreSymlink "/home/jb/.dotfiles/.local/share/PrismLauncher";
}
