{ config, pkgs, lib, sources, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      neo-tree-nvim
    ];
    defaultEditor = true;

    extraLuaConfig = builtins.readFile ./init.lua;
  };
}
