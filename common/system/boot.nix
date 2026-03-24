{ pkgs, lib, ... }:

{
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      systemd-boot = {
        enable = true;
      };
    };
    kernelPackages = lib.mkDefault pkgs.linuxPackages_zen;
    kernel = {
      sysctl = {
        "net.ipv4.ip_forward" = true;
        "net.ipv6.conf.all.forwarding" = true;
      };
    };
  };

  specialisation = {
    latest.configuration = {
      boot.kernelPackages = pkgs.linuxPackages_latest;
    };
    lts.configuration = {
      boot.kernelPackages = pkgs.linuxPackages;
    };
  };
}
