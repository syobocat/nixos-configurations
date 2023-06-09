{ config, ... }:

{
  nix.nixPath = [
    "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
    "nixos-config=/home/syobon/nixos-configurations/index.nix"
    "/nix/var/nix/profiles/per-user/root/channels"
  ];

  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "NixOS";

  time.timeZone = "Asia/Tokyo";
  i18n.defaultLocale = "ja_JP.UTF-8";

  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [
      { groups = [ "wheel" ]; noPass = true; keepEnv = true; }
    ];
  };

  system.copySystemConfiguration = true;

  nixpkgs.config.allowUnfree = true;
  
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    channel = "https://channels.nixos.org/nixos-unstable";
  };

  system.stateVersion = "23.05";
}
