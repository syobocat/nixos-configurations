{ pkgs, ... }:

{
  programs.dconf.enable = true;

  home-manager.users.syobon.gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };

    theme = {
      package = pkgs.arc-theme;
      name = "Arc";
    };
  };
}
