{ config, pkgs, ... }:

{
  environment.pathsToLink = [ "/share/zsh" ];

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    promptInit = ''
      autoload -U promptinit colors
      promptinit; colors
      PROMPT="[%n@%m %{$fg[green]%}%~%{$reset_color%}]%# "
      RPROMPT="%{$fg[red]%}[%?]%{$reset_color%}"
    '';
  };
  home-manager.users.syobon.programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    
    initExtra = ''
      zstyle ':completion:*' menu select
      zstyle ':completion:*' group-name ""
      zstyle ':completion:*:descriptions' format '%F{yellow}completing %B%d%b'$DEFAULT
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
      setopt COMPLETE_IN_WORD
      setopt GLOB_COMPLETE
    '';
  };

  users.defaultUserShell = pkgs.zsh;
}
