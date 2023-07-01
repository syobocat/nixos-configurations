{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ ranger ];

  home-manager.users.syobon.xdg.configFile = {
    "ranger/rifle.conf".source = ./ranger/rifle.conf;
  };
}
