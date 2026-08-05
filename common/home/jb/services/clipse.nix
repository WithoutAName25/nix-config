{ pkgs, ... }:

{
  home.packages = with pkgs; [ wl-clipboard ];

  services.clipse = {
    enable = true;
    settings = {
      imageDisplay = {
        type = "kitty";
      };
    };
  };
}
