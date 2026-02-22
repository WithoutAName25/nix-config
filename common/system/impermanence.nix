{ inputs, ... }:

{
  imports = [ inputs.impermanence.nixosModules.impermanence ];

  environment.persistence."/persistent" = {
    enable = true;
    hideMounts = true;
    directories = [ "/var/lib/nixos" ];
    files = [ ];
  };
}
