{
  programs.git = {
    enable = true;
    userEmail = "amano.takahisa@gmail.com";
    userName = "Taka";

    aliases = {
      aliases = "config --get-regexp '^alias\\.'";
      bl = "blame --abbrev=6";
      lo = "log --graph --all --format='%C(white dim) %h %Creset %s %C(cyan dim)(%ar)%Creset%C(green) <%an>%C(bold yellow)%d%Creset'";
      loo = "log --stat --graph --decorate --all";
      root = "rev-parse --show-toplevel";
      sh = "show --color-words='[^[:space:]]'";
      st = "status --short --branch";
      pushf = "push --force-with-lease --force-if-includes";
    };
    extraConfig = {
      blame = {
        coloring = "highlightRecent";
        date = "short";
      };
      color = {
        blame.highlightRecent = "160, 6 month ago, 166, 3 month ago, 172, 1 month ago, 178, 1 week ago, 184, 1 day ago, 190";
        ui = "auto";
        verbose = true;
        };
      commit.verbose = true;
      pull.rebase = true;
      rebase.autoStash = true;
      # Use different email and name for work git
      # save follows as ~/Documents/work/.gitconfig
      # [user]
      #     email = <work-email@example.com>
      #     name = Taka
      includeIf."gitdir:~/Documents/work/" = {
        path = "~/Documents/work/.gitconfig";
      };
      fetch.prune = true;
      remote.origin.prune = true;
      grep.linenumber = true;
      log.date = "iso-local";
      core.commentchar = ";";
      init.defaultBranch = "main";
    };
  };
}
