{ config, ... }:

{
  users.users.syobon = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "libvirtd" ];
    hashedPassword = "$y$j9T$0kIQREzeED72PjVpkkNxi.$KW4krUcKgfkLMOr9b/P27jJ3z.yjuOIh6eNY30ohiH6";
  };

  home-manager.users.syobon = {
    programs = {
      git = {
        enable = true;
        userName = "syobon";
        userEmail = "syobon@syobon.net";
      };
    };
  };
}
