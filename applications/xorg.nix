{ config, pkgs, ... }:

{
  imports = [
    ./desktop-i3.nix
    ./firefox.nix
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
    pulseaudio
    discord
  ];

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  fonts = {
    fonts = with pkgs; [
      font-awesome
      cascadia-code
      noto-fonts
      noto-fonts-cjk
      noto-fonts-extra
      noto-fonts-emoji
    ];
    fontconfig = {
      defaultFonts = {
        sansSerif = [ "Noto Sans" "Noto Sans CJK JP" ];
	serif = [ "Noto Serif" "Noto Serif CJK JP" ];
	monospace = [ "Cascadia Code" "Noto Sans Mono CJK JP" ];
      };
    };
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-skk
    ];
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;
}
