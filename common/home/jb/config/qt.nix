{ pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme = "qtct";
    style.name = "kvantum";
  };

  home = {
    packages = with pkgs; [ kdePackages.qtstyleplugin-kvantum ];
    sessionVariables = {
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };
  };
}
