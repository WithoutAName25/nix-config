{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  zramSwap.enable = true;

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  services.udev.packages = [
    pkgs.yubikey-personalization
  ];

  users.users = {
    root = {
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [
        "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIGmSRnak0xY4AX0NJ+7vHmRvOPsxQvPsmVnQGB/YuJBOAAAABHNzaDo= withoutaname@withoutaname.eu"
      ];
    };
    nixos = {
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [
        "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIGmSRnak0xY4AX0NJ+7vHmRvOPsxQvPsmVnQGB/YuJBOAAAABHNzaDo= withoutaname@withoutaname.eu"
      ];
    };
  };

  i18n = {
    defaultLocale = "de_DE.UTF-8";
    extraLocaleSettings.LC_MESSAGES = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Berlin";

  console.keyMap = "de-latin1-nodeadkeys";

  networking.networkmanager.enable = true;

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    git
    neovim
    age
    sops
    parted
    gptfdisk
    btrfs-progs
    cryptsetup
    usbutils
    tmux
  ];
}
