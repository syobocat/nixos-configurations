{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ cava ];
  home-manager.users.syobon.programs.waybar = {
    enable = true;
    package = with pkgs; (waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true "]; }));
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        output = [ "DP-1" ];
        modules-left = [ "wlr/workspaces" ];
        modules-center = [ "cpu" "custom/gpu" "memory" "custom/uptime" "wireplumber" "clock" ];
        modules-right = [ "tray" ];

        "cpu" = {
          interval = 5;
          format = " {usage:2}%";
        };

        "custom/gpu" = {
          interval = 5;
          format = " {percentage:2}%";
          exec = pkgs.writeShellScript "gpu" ''
            nvidia-smi -q | awk '/Gpu/{print $3}'
          '';
        };

        "memory" = {
          interval = 5;
          format = " {percentage:2}%";
        };

        "custom/uptime" = {
          interval = 60;
          format = "{}";
          exec = pkgs.writeShellScript "uptime" ''
            env LANG=C uptime | sed 's/.*up \([^,]*\),.*/\1/'
          '';
        };

        "wireplumber" = {
          format = " [{icon}] {volume:3}%";
          format-muted = " [--------MUTE--------] {volume:3}%";
          format-icons = [ 
            "                    "
            ">                   "
            "=>                  "
            "==>                 "
            "===>                "
            "====>               "
            "=====>              "
            "======>             "
            "=======>            "
            "========>           "
            "=========>          "
            "==========>         "
            "===========>        "
            "============>       "
            "=============>      "
            "==============>     "
            "===============>    "
            "================>   "
            "=================>  "
            "==================> "
          ];
        };

        "clock" = {
          interval = 1;
          format = " {:%Y/%m/%d (%a) / %H:%M %S}";
        };

        "tray" = {
          icon-size = 24;
          show-passive-items = true;
        };
      };
    };
    style = ''
* {
    font-family: FontAwesome, Cascadia Code, Noto Sans Mono CJK JP;
    font-size: 15px;
}

window#waybar {
    background-color: #181c24;
    color: #ffffff;
}

#workspaces button {
  padding: 0px 10px;
  border: none;
}
#workspaces label {
    color: #afafaf;
}
#workspaces button.active {
    background-color: #afafaf;
}
#workspaces button.active label {
    color: #181c24;
}
#workspaces button:hover {
  background: inherit;
  box-shadow: none;
}
#workspaces button.active:hover {
  background: #afafaf;
}
#workspaces button:hover box {
  text-shadow: none;
}

#cpu, #custom-gpu, #memory, #custom-uptime, #wireplumber, #clock {
    padding: 0 10px;
    margin: 2px 0;
}

#cpu {
    background-color: #e06c75;
    border-radius: 10px 0 0 10px;
}

#custom-gpu {
    background-color: #e5c07b;
}

#memory {
    background-color: #98c379;
}

#custom-uptime {
    background-color: #56b6c2;
}

#wireplumber {
    background-color: #9b9beb
}

#clock {
    background-color: #d787d7;
    border-radius: 0 10px 10px 0;
}

#mpd {
    font-size: 12px;
    margin: 0 30px;
}
    '';
  };
}
