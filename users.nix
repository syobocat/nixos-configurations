{ config, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
    ./dotfiles
  ];

  users.users.syobon = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    hashedPassword = "$y$j9T$0kIQREzeED72PjVpkkNxi.$KW4krUcKgfkLMOr9b/P27jJ3z.yjuOIh6eNY30ohiH6";
  };
  users.mutableUsers = false;

  home-manager.users.syobon = {
    home.stateVersion = "23.05";

    programs = {
      git = {
        enable = true;
        userName = "syobon";
        userEmail = "syobon@syobon.net";
	signing = {
	  key = "AF0694D53CE33A377612CB05AB36E5BE433C6979";
	  signByDefault = true;
	};
      };
      gpg = {
        enable = true;
	mutableKeys = false;
	mutableTrust = false;
        publicKeys = [{
	  source = ./pubkey.pgp;
	  trust = 5;
	}];
      };
    };

    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
      sshKeys = [ "21AD5002FE3D89575D09B9AF024AA78D87EBFA71" ];
    };
  };
}
