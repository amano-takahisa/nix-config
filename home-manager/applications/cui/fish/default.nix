{
  programs.fish = {
    enable = true;
    preferAbbrs = true;
    shellAbbrs = {
      l = "sza --long --classify --all --time-style=long-iso --group-directories-first";
      ll = "eza --long --classify --all --time-style=long-iso --group-directories-first";
      llt = "eza --long --classify --all --time-style=long-iso --group-directories-first --sort=changed";
      tree = "eza --tree --classify=auto";
      treel = "eza --tree --classify=auto --long";
      rm = "rm -I";
    };
  };
}

