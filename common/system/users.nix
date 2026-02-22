{ pkgs, ... }:

{
  users = {
    mutableUsers = false;
    users.root = {
      initialPassword = "root";
      shell = pkgs.fish;
    };
    users.jb = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      initialPassword = "jb";
      shell = pkgs.fish;
    };
  };
}
