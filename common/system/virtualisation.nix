{ ... }:

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
      };
    };

    podman = {
      enable = true;
    };
  };
}
