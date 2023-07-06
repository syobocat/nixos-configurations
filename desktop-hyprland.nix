{ config, pkgs, ... }:

{
  imports = [
    ./desktop.nix
    
    ./applications/hyprland.nix
    ./applications/waybar.nix
    ./applications/dunst.nix
    ./applications/alacritty.nix
    ./applications/gtk.nix
    ./applications/ranger.nix
  ];

  programs.hyprland = {
    enable = true;
  };

  environment.loginShellInit = ''
    if [ -z "''${DISPLAY}" ]; then
      exec Hyprland
    fi
  '';
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    sway-contrib.grimshot
    nomacs
    pulseaudio
    udevil
    (ffmpeg.override { withFullDeps = true; })
    unzipNLS
    wofi
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };
}
