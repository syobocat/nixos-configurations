{ config, pkgs, ... }:

{
  system.stateVersion = "23.05";
  home-manager.users.syobon.home.stateVersion = "23.05";

  networking.hostName = "NixOS";

  networking.hosts = {
    "192.168.0.150" = [ "cloud.syobon.net" "minecraft.syo.bar" ];
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;

  services.xserver = {
    videoDrivers = [ "nvidia" ];
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  programs.hyprland.nvidiaPatches = true;

  fileSystems."/storage" = {
    device = "/dev/disk/by-uuid/2b5f6527-7b8b-4fa9-8efe-a5243d77b621";
    fsType = "btrfs";
  };

  virtualisation.podman.enable = true;
}
