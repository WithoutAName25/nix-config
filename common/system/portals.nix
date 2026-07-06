{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      kdePackages.xdg-desktop-portal-kde
    ];
    config.niri = {
      default = "kde";
      "org.freedesktop.impl.portal.ScreenCast" = "gnome";
      "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
      "org.freedesktop.impl.portal.Settings" = "gtk";
    };
  };

  systemd.user.services.xdg-desktop-portal-deadlock-fix = {
    description = "Restart xdg-desktop-portal after backends settle";
    after = [
      "xdg-desktop-portal.service"
      "graphical-session.target"
    ];
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStartPre = "${pkgs.coreutils-full}/bin/sleep 5";
      ExecStart = "${pkgs.systemd}/bin/systemctl --user restart xdg-desktop-portal.service";
    };
  };
}
