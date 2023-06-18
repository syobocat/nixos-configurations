{
  home-manager.users.syobon.programs.helix = {
    enable = true;
    settings = {
      theme = "onedark";
      editor = {
        shell = [ "zsh" "-c" ];
        cursorline = true;
        color-modes = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "bar";
        };
        statusline = {
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
          right = [ "file-type" "file-encoding" "file-line-ending" "separator" "position-percentage" "position" ];
        };
        indent-guides.render = true;
        lsp = {
          display-messages = true;
        };
      };
    };
  };
}
