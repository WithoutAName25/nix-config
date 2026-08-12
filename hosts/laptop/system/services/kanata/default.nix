{ lib, ... }:

{
  services.kanata = {
    enable = true;
    keyboards = {
      builtin = {
        devices = [
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = lib.fileContents ./builtin.kbd;
      };
    };
  };
}
