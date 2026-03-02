{ pkgs, ... }:

{
  services.udev = {
    packages = [ pkgs.yubikey-personalization ];
  };

  services.printing = {
    enable = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
}
