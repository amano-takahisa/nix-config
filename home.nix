{ config, pkgs, ... }:

{
  home.username = "takahisa";
  home.homeDirectory = "/home/takahisa";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    ##### basic tool #####
    bat
    eza
    fd
    fish
    fzf
    htop
    less
    libsixel
    nodejs
    sshfs
    which
    zip

    ##### Neovim #####
    eslint
    neovim
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
    git
    lazygit

    ##### misc #####
    tmux
    tree
    unzip
    wl-clipboard
    xdg-user-dirs
    zk

    ##### fonts #####
    hackgen-nf-font
    font-awesome
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  programs.git.enable = true;
  programs.zsh.enable = true;
  programs.tmux.enable = true;
}

