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
  # networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tokyo";

  i18n.defaultLocale = "en_US.UTF-8";

  system.copySystemConfiguration = true;


  system.stateVersion = "23.05";
}
