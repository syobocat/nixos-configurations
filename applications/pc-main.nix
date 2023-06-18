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
  ];

  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

  programs.java.enable = true;
}
