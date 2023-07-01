{ config, pkgs, ... }:

{
  imports = [
    ./desktop.nix

    ./applications/i3.nix
    ./applications/rofi.nix
    ./applications/picom.nix
    ./applications/dunst.nix
    ./applications/alacritty.nix
    ./applications/gtk.nix
    ./applications/ranger.nix
  ];

  environment.pathsToLink = [ "/libexec" ];
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3blocks
        feh
        imagemagick
        udevil
        pulseaudio
        xclip
        (ffmpeg.override { withFullDeps = true; })
        unzipNLS
      ];
    };
  };

  home-manager.users.syobon.xdg.configFile = {
    "i3blocks/config".source = ./applications/i3blocks/config;
    "i3blocks/volume.sh".source = ./applications/i3blocks/volume.sh;
  };
}
