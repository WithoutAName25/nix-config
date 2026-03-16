{ ... }:

{
  networking = {
    nftables = {
      enable = true;
    };
    networkmanager = {
      enable = true;
    };
    firewall = {
      enable = true;
      filterForward = true;
      extraForwardRules = ''
        iifname "virbr0" oifname "enp42s0" accept comment "libvirt VM internet"
        iifname "virbr0" oifname "virbr0" accept comment "libvirt VM cross traffic"
      '';
      interfaces = {
        "virbr0" = {
          allowedTCPPorts = [
            53
          ];
          allowedUDPPorts = [
            53
            67
          ];
        };
      };
    };
  };
}
