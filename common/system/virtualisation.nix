{ pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
    };

    libvirtd = {
      enable = true;
      onBoot = "ignore";
      onShutdown = "shutdown";

      qemu = {
        runAsRoot = false;
        vhostUserPackages = with pkgs; [ virtiofsd ];
      };
    };

    podman = {
      enable = true;
    };
  };
}
