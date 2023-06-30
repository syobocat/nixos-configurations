{
  home-manager.users.syobon.xdg.configFile = {
    "libskk/rules/user" = {
      recursive = true;
      source = ./libskk/user;
    };
  };
}
