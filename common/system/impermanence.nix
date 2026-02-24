{ inputs, ... }:

{
  imports = [ inputs.impermanence.nixosModules.impermanence ];

  environment.persistence."/persistent" = {
    enable = true;
    hideMounts = true;
    directories = [ "/var/lib/nixos" ];
    files = [
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
}
