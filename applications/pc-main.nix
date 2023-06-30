{ config, pkgs, ...}:

{
  imports = [
    ./desktop-i3.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;

  services.xserver = {
    videoDrivers = [ "nvidia" ];
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  fileSystems."/storage" = {
    device = "/dev/disk/by-uuid/2b5f6527-7b8b-4fa9-8efe-a5243d77b621";
    fsType = "btrfs";
  };

  environment.systemPackages = with pkgs; [
    prismlauncher
    osu-lazer-bin
    discord
    element-desktop
    obs-studio
    wineWowPackages.stableFull
    wineWowPackages.fonts
    winetricks
    virt-manager
    helix
    texlive.combined.scheme-full
    libreoffice-fresh
    rustc
    rustfmt
    rust-analyzer
    clippy
    cargo
    godot_4
  ];

  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

  programs.java.enable = true;
}
