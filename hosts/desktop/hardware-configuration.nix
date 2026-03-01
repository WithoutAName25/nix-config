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
      systemd.enable = true;
      luks.devices."nixroot".device = "/dev/disk/by-partlabel/nixroot";
    };
  };

  fileSystems = {
    "/" = {
      device = "none";
      fsType = "tmpfs";
      options = [
        "size=4G"
        "mode=755"
      ];
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

    "/persistent" = {
      device = "/dev/mapper/nixroot";
      fsType = "btrfs";
      options = [
        "subvol=@persistent"
        "compress=zstd"
        "noatime"
      ];
      neededForBoot = true;
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/A541-F7CA";
      fsType = "vfat";
      options = [
        "umask=0077"
      ];
    };
  };

  swapDevices = [ ];

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
