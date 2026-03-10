{ inputs, config, ... }:

{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    defaultSopsFile = ../../../secrets/home.yaml;
    age.keyFile = "/etc/sops/age.key";
  };

  xdg.configFile."sops/age/keys.txt".source = config.lib.file.mkOutOfStoreSymlink "/etc/sops/age.key";
}
