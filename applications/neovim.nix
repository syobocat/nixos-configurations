{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  home-manager.users.syobon.programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      cmp-nvim-lsp
      indentLine
      mason-lspconfig-nvim
      mason-nvim
      nvim-autopairs
      nvim-cmp
      nvim-lspconfig
      nvim-treesitter
      nvim-ts-rainbow2
      vim-airline
      vim-one
    ];
    extraLuaConfig = builtins.readFile ./nvim/init.lua;
  };
}
