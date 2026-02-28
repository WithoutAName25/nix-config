{ inputs, pkgs, ... }:

{
  imports = [ inputs.zen-browser.homeModules.beta ];

  programs.zen-browser = {
    enable = true;

    policies = {
      DisableAppUpdate = true;
      DisableFeedbakcCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTracingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };

    profiles = {
      default = {
        id = 0;
        isDefault = true;

        extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          ublock-origin
        ];

        search = {
          force = true;
          default = "startpage";
          engines = {
            startpage = {
              name = "Startpage";
              url = [
                {
                  template = "https://www.startpage.com/sp/search";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "https://www.startpage.com/sp/cdn/favicons/favicon-32x32.png";
              definedAliases = [ "@sp" ];
            };
          };
        };

        settings = {
          browser = {
            tabs.warnOnClose = false;
            download.panel.shown = false;
          };
        };
      };
    };

    suppressXdgMigrationWarning = true;
  };
}
