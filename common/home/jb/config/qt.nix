{ pkgs, lib, ... }:

let
  catppuccin-kde-modified = pkgs.catppuccin-kde.override {
    flavour = [ "mocha" ];
    accents = [ "sapphire" ];
    winDecStyles = [ "modern" ];
  };
in
{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  home = {
    packages = with pkgs; [
      catppuccin-kde-modified
      kdePackages.qtstyleplugin-kvantum
    ];
    sessionVariables = {
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };
  };

  xdg = {
    configFile = (
      let
        kdeGlobals = {
          UiSettings = {
            ColorScheme = "CatppuccinMochaSapphire";
          };
        };
        qtSettings = {
          Appearance = {
            custom_palette = true;
            icon_theme = "Papirus-Dark";
            standard_dialogs = "xdgdesktopportal";
            style = "kvantum-dark";
          };
          Interface = {
            activate_item_on_single_click = 2;
          };
        };
      in
      {
        "kdeglobals".text = lib.generators.toINI { } kdeGlobals;
        "qt5ct/qt5ct.conf".text = lib.generators.toINI { } qtSettings;
        "qt6ct/qt6ct.conf".text = lib.generators.toINI { } qtSettings;
      }
    );

    # Hacky fix since it is for some reason not linked correctly when installed
    dataFile."color-schemes/CatppuccinMochaSapphire.colors".source =
      "${catppuccin-kde-modified}/share/color-schemes/CatppuccinMochaSapphire.colors";
  };
}
