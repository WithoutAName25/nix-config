{ pkgs, ... }:

{
  services.udev = {
    packages = [ pkgs.yubikey-personalization ];
    extraRules = ''
      SUBSYSTEM=="usb", ATTRS{idVendor}=="2e8a", ATTR{idProduct}=="[01]*", MODE="0664", GROUP="dialout"
    '';
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
}
