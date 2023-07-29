{ config, pkgs, ... }:

{
  imports = [
    ./applications/firefox.nix
    ./applications/libskk.nix
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      font-awesome
      cascadia-code
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
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
          ntfs_defaults = "uid=$UID,gid=$GID,noatime";
        };
      };
    };
  };

}
