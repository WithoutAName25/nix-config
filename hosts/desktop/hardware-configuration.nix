{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];

    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
      ];
      kernelModules = [ ];
      systemd = {
        enable = true;
      };
      luks.devices = {
        "nixroot".device = "/dev/disk/by-partlabel/nixroot";
        "nixdata" = {
          device = "/dev/disk/by-partlabel/nixdata";
          keyFile = "/sysroot/persistent/system/etc/secrets/nixdata.key";
        };
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
        "size=16G"
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
      device = "/dev/mapper/nixdata";
      fsType = "btrfs";
      options = [
        "subvol=@persistent-cache"
        "compress=zstd"
        "noatime"
      ];
      neededForBoot = true;
    };

    "/persistent/data" = {
      device = "/dev/mapper/nixdata";
      fsType = "btrfs";
      options = [
        "subvol=@persistent-data"
        "compress=zstd"
        "noatime"
      ];
      neededForBoot = true;
    };

    "/persistent/vault" = {
      device = "/dev/mapper/nixdata";
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

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  services.xserver.videoDrivers = [ "nvidia" ];

  my.allowedUnfreePkgs = [ "nvidia-x11" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = false;
  };
}
