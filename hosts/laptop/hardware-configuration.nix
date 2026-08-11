{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "usbhid" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot = {
    initrd = {
      systemd = {
        enable = true;
      };
      luks.devices = {
        "nixroot".device = "/dev/disk/by-partlabel/nixroot";
        "nixswap" = {
          device = "/dev/disk/by-partlabel/nixswap";
          keyFile = "/sysroot/persistent/system/etc/secrets/nixswap.key";
        };
      };
    };
  };

  fileSystems = {
    "/" = {
      device = "none";
      fsType = "tmpfs";
      options = [
        "size=8G"
        "mode=755"
      ];
      neededForBoot = true;
    };

    "/boot" = {
      device = "/dev/disk/by-partlabel/nixboot";
      fsType = "vfat";
      options = [
        "umask=0077"
      ];
      neededForBoot = true;
    };

    "/nix" = {
      device = "/dev/mapper/nixroot";
      fsType = "btrfs";
      options = [
        "subvol=@nix"
        "compress=zstd"
        "noatime"
      ];
      neededForBoot = true;
    };

    "/persistent/system" = {
      device = "/dev/mapper/nixroot";
      fsType = "btrfs";
      options = [
        "subvol=@persistent-system"
        "compress=zstd"
        "noatime"
      ];
      neededForBoot = true;
    };

    "/persistent/cache" = {
      device = "/dev/mapper/nixroot";
      fsType = "btrfs";
      options = [
        "subvol=@persistent-cache"
        "compress=zstd"
        "noatime"
      ];
      neededForBoot = true;
    };

    "/persistent/data" = {
      device = "/dev/mapper/nixroot";
      fsType = "btrfs";
      options = [
        "subvol=@persistent-data"
        "compress=zstd"
        "noatime"
      ];
      neededForBoot = true;
    };

    "/persistent/vault" = {
      device = "/dev/mapper/nixroot";
      fsType = "btrfs";
      options = [
        "subvol=@persistent-vault"
        "compress=zstd"
        "noatime"
      ];
      neededForBoot = true;
    };
  };

  swapDevices = [
    { device = "/dev/mapper/nixswap"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vpl-gpu-rt
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-media-driver
      ];
    };
    tuxedo-drivers.enable = true;
    tuxedo-rs = {
      enable = true;
      tailor-gui.enable = true;
    };
  };
}
