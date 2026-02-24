{ ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        identityFile = [
          "~/.ssh/rk_pin"
          "~/.ssh/rk_touch"
        ];
      };
    };
  };

  sops = {
    secrets = {
      "ssh/rk_pin/private" = {
        path = ".ssh/rk_pin";
        mode = "0600";
      };
      "ssh/rk_pin/public" = {
        path = ".ssh/rk_pin.pub";
        mode = "0644";
      };
      "ssh/rk_touch/private" = {
        path = ".ssh/rk_touch";
        mode = "0600";
      };
      "ssh/rk_touch/public" = {
        path = ".ssh/rk_touch.pub";
        mode = "0644";
      };
    };
  };
}
