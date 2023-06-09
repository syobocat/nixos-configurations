{ pkgs, ... }:

{
  home-manager.users.syobon.services.dunst = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
    settings = {
      global = {
        frame_color = "#181c24";
        background = "#f9f9fb";
        foreground = "#181c24";
      };
    };
  };
}
