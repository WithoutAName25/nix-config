{ inputs, ... }:

{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = ../../secrets/system.yaml;
    age.keyFile = "/persistent/system/etc/sops/age.key";
  };
}
