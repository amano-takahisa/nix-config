{ config, pkgs, lib, sources, ... }:
let
  initLua = builtins.readFile ./init.lua;
  optionsLua = builtins.readFile ./options.lua;
  keymapsLua = builtins.readFile ./keymaps.lua;

  pluginFiles = builtins.attrNames (builtins.readDir ./plugins);
  pluginLua = lib.concatMapStringsSep "\n\n" (file:
    builtins.readFile (./plugins + "/${file}")
  ) pluginFiles;
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      neo-tree-nvim
    ];

    extraLuaConfig = ''
      ${initLua}
      ${optionsLua}
      ${keymapsLua}
      ${pluginLua}
    '';
  };
}
