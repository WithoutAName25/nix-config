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

  system.boot.loader.kernelFile = "vmlinuz";

  specialisation = {
    latest.configuration = {
      system.boot.loader.kernelFile = lib.mkForce "bzImage";
      boot.kernelPackages = pkgs.linuxPackages_latest;
    };
    lts.configuration = {
      system.boot.loader.kernelFile = lib.mkForce "bzImage";
      boot.kernelPackages = pkgs.linuxPackages;
    };
  };
}
