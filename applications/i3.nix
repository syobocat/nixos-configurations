{ config, lib, ... }:

let
  mod = "Mod4";
  up = "w";
  left = "a";
  down = "o";
  right = "e";
  menu = "\"rofi -show drun\"";
in {
  home-manager.users.syobon.xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "${mod}";

      menu = "${menu}";
      terminal = "alacritty";
      startup = [
        { command = "fcitx5 -dr"; notification = false; }
      ];

      defaultWorkspace = "workspace number 1";

      gaps = {
        inner = 10;
	    smartGaps = true;
      };

      window = {
        titlebar = false;
        border = 3;
        hideEdgeBorders = "smart";
      };

      fonts = {
        names = [ "Noto Sans Mono CJK JP" ];
        size = 8.0;
      };

      bars = [{
        statusCommand = "i3blocks";
        position = "top";
        mode = "dock";
        fonts = {
	      names = [ "Cascadia Code" "Noto Sans Mono CJK JP" ];
	      size = 11.0;
	    };
        colors = {
          background = "#181c24";
          focusedWorkspace = {
            background = "#afafaf";
            border = "#afafaf";
            text = "#181c24";
          };
          inactiveWorkspace = {
            background = "#181c24";
            border = "#afafaf";
            text = "#afafaf";
          };
        };
        extraConfig = ''separator_symbol " / "'';
      }];

      keybindings = lib.mkOptionDefault {
        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5% && pkill -SIGRTMIN+10 i3blocks";
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5% && pkill -SIGRTMIN+10 i3blocks";
        "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle && pkill -SIGRTMIN+10 i3blocks";
        "XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";

        "${mod}+z" = "exec ${menu}";
  	    "${mod}+${up}" = "focus up";
  	    "${mod}+${left}" = "focus left";
	    "${mod}+${down}" = "focus down";
	    "${mod}+${right}" = "focus right";
	
        "${mod}+Shift+${up}" = "move up";
        "${mod}+Shift+${left}" = "move left";
        "${mod}+Shift+${down}" = "move down";
        "${mod}+Shift+${right}" = "move right";
      };
      modes = {
        resize = {
	  
	    };
      };
    };
  };
}
