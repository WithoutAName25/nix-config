{ pkgs, ... }:

{
  home.packages = with pkgs; [ wl-clipboard ];

  services.clipse = {
    enable = true;
    imageDisplay = {
      type = "kitty";
    };
  };
}
