{ config, ... }:

{
  imports = [
    ./user-syobon.nix
  ];
  
  home-manager.users.syobon = {
    programs = {
      git = {
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
