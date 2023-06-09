{ config, pkgs, ... }:

{
  imports = [
    ./i3.nix
    ./rofi.nix
    ./picom.nix
    ./dunst.nix
    ./alacritty.nix
    ./devmon.nix
    ./gtk.nix
  ];

  environment.pathsToLink = [ "/libexec" ];
  services.xserver = {
    desktopManager.xterm.enable = false;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        #rofi
        i3blocks

        #alacritty
        ranger
        feh
        dunst
      ];
    };
  };

  home-manager.users.syobon.xdg.configFile = {
    "i3blocks/config".source = ./i3blocks/config;
    "i3blocks/volume.sh".source = ./i3blocks/volume.sh;
  };
}
