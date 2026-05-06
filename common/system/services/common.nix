{ pkgs, ... }:

{
  services.udev = {
    packages = [ pkgs.yubikey-personalization ];
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
}
