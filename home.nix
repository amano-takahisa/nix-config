{ config, pkgs, ... }:

{
  home.username = "takahisa";
  home.homeDirectory = "/home/takahisa";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    # neovim
    # git
    htop
    fzf
    unzip
    # tmux
  ];

  programs.neovim.enable = true;
  programs.git.enable = true;
  programs.zsh.enable = true;
  programs.tmux.enable = true;
}

