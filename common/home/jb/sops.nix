{ inputs, ... }:

{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    defaultSopsFile = ../../../secrets/home.yaml;
    age.keyFile = "/etc/sops/age.key";
  };
}
