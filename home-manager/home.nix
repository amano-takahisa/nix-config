{ config, pkgs, ... }:

let
  lib = config.lib;
in

{
  home.username = "takahisa";
  home.homeDirectory = "/home/takahisa";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    ##### basic tool #####
    bat
    eza
    fd
    fzf
    gcc
    htop
    less
    libsixel
    gnumake
    nodejs
    sshfs
    which
    zip

    ##### Neovim #####
    eslint
    nodePackages.prettier
    python3
    python3Packages.pynvim
    tree-sitter

    ##### Python #####
    isort
    jq
    pixi
    ripgrep
    ripgrep-all
    ruff

    ##### git #####
    gh
    lazygit

    ##### misc #####
    tree
    unzip
    wl-clipboard
    xdg-user-dirs
    zk

    ##### fonts #####
    hackgen-nf-font
    font-awesome
  ];
  nixpkgs.config.allowUnfree = true;
}

