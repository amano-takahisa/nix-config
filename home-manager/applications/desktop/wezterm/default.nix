{ config, pkgs, ... }:

let
  lib = config.lib;
in

{
  home.packages = [pkgs.wezterm];
}

