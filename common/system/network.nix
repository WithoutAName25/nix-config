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
        iifname "docker0" oifname "enp42s0" accept comment "docker internet"
        iifname "docker0" oifname "docker0" accept comment "docker cross traffic"
      '';
      interfaces = {
        "enp42s0" = {
          allowedTCPPorts = [
            22000
          ];
        };
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
    extraHosts = ''
      127.0.0.42 paradise-s1.battleye.com
      127.0.0.42 test-s1.battleye.com
      127.0.0.42 paradiseenhanced-s1.battleye.com
    '';
  };
}
