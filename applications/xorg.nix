{ config, pkgs, ... }:

{
  imports = [
    ./desktop-i3.nix
    ./firefox.nix
    ./steam.nix
  ];

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  environment.systemPackages = with pkgs; [
    xclip
    (ffmpeg.override { withFullDeps = true; })
    prismlauncher
    pulseaudio
    discord
    obs-studio
    wineWowPackages.stable
    winetricks
    lapce
    helix
  ];

  programs.java.enable = true;

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      font-awesome
      cascadia-code
      noto-fonts
      #noto-fonts-cjk
      noto-fonts-extra
      noto-fonts-emoji
      source-han-sans
      source-han-mono
      source-han-serif
    ];
    fontconfig = {
      defaultFonts = {
        sansSerif = [ "Noto Sans" "Source Han Sans" ];
        #sansSerif = [ "Noto Sans" "Noto Sans CJK JP Regular" ];
        serif = [ "Noto Serif" "Source Han Serif" ];
        #serif = [ "Noto Serif" "Noto Sans CJK JP Regular" ];
        monospace = [ "Cascadia Code" "Source Han Mono" ];
        #monospace = [ "Cascadia Code" "Noto Sans Mono CJK JP Regular" ];
      };
    };
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-skk
    ];
  };

  services.udisks2 = {
    enable = true;
    settings = {
      "mount_options.conf" = {
        defaults = {
          ntfs_defaults = "uid=$UID,gid=$GID,noatime,prealloc";
        };
      };
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;
}
