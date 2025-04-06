{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    customPaneNavigationAndResize = true;
    enable = true;
    keyMode="vi";
    mouse = true;
    prefix = "C-a";
    terminal = "screen-256color";

    extraConfig = ''
    set-option -a terminal-features "xterm-256color:RGB"
    set-option -sg escape-time 100
    '';
  };
}

