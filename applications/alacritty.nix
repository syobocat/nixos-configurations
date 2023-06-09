{
  home-manager.users.syobon.programs.alacritty = {
    enable = true;
    settings = {
      font.normal.family = "Cascadia Mono PL";
      colors = {
        primary = {
          background = "#282c34";
	  foreground = "#abb2bf";
        };
	cursor = {
	  text = "CellBackground";
	  cursor = "#528bff";
	};
	selection = {
	  text = "CellForeground";
	  background = "#3e4451";
	};
        normal = {
          black = "#5c6370";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#e5c07b";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#828997";
        };
      };
    };
  };
}
