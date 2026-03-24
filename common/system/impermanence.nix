{ inputs, ... }:

{
  imports = [ inputs.impermanence.nixosModules.impermanence ];

  environment.persistence = {
    "/persistent/system" = {
      hideMounts = true;
      directories = [
        "/etc/NetworkManager/system-connections"
        "/var/db/sudo"
        "/var/lib/nixos"
        "/var/lib/OpenRGB"
        "/var/lib/systemd/coredump"
        "/var/lib/systemd/timers"
        "/var/log"
      ];
      files = [
        "/etc/machine-id"
        {
          file = "/etc/sops/age.key";
          parentDirectory = {
            user = "root";
            group = "users";
            mode = "0750";
          };
        }
      ];
    };

    "/persistent/data" = {
      hideMounts = true;
      directories = [ "/var/lib/libvirt" ];
    };
  };
}
