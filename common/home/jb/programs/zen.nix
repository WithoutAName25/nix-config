{ inputs, ... }:

{
  imports = [ inputs.zen-browser.homeModules.beta ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

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

        userChrome = ''
          ${builtins.readFile "${inputs.catppuccin-zen}/themes/Frappe/Sapphire/userChrome.css"}
          ${builtins.readFile "${inputs.catppuccin-zen}/themes/Mocha/Sapphire/userChrome.css"}
        '';
        userContent = ''
          ${builtins.readFile "${inputs.catppuccin-zen}/themes/Frappe/Sapphire/userContent.css"}
          ${builtins.readFile "${inputs.catppuccin-zen}/themes/Mocha/Sapphire/userContent.css"}
        '';
      };
    };
  };
}
