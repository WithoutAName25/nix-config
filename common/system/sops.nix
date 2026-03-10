{ inputs, ... }:

{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = ../../secrets/system.yaml;
    age.keyFile = "/etc/sops/age.key";
  };
}
