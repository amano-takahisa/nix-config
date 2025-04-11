{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
    local wezterm = require 'wezterm';
    return {
      font = wezterm.font("JetBrains Mono"),
      hide_tab_bar_if_only_one_tab = true,
    }
    '';
  };
}
