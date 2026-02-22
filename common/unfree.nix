{ config, lib, ... }:

{
  options.my.allowedUnfreePkgs = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
  };
  config.nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (lib.getName pkg) config.my.allowedUnfreePkgs;
}
