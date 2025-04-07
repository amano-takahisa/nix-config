{ config, pkgs, ... }:

let
  lib = config.lib;
in

{
  home.packages = [pkgs.neovim];
  home.file = {
  ".config/nvim" = {
      source = lib.file.mkOutOfStoreSymlink /home/takahisa/nix-config/nvim;
    };
  };
}
