{ pkgs, config, ... }:

{
  users = {
    mutableUsers = false;
    users.root = {
      hashedPasswordFile = config.sops.secrets."users/root/password_hash".path;
      shell = pkgs.fish;
    };
    users.jb = {
      isNormalUser = true;
      extraGroups = [
        "input"
        "wheel"
      ];
      hashedPasswordFile = config.sops.secrets."users/jb/password_hash".path;
      shell = pkgs.fish;
    };
  };
  sops.secrets = {
    "users/root/password_hash".neededForUsers = true;
    "users/jb/password_hash".neededForUsers = true;
  };
}
