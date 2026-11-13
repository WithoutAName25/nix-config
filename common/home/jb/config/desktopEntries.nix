{ ... }:

{
  xdg.desktopEntries = {
    "kali" = {
      name = "Kali VM";
      exec = ''sh -c "virsh --connect qemu:///system start Kali; virt-viewer --connect qemu:///system --attach --wait Kali"'';
      terminal = false;
    };
  };
}
