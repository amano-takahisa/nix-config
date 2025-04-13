{ config, pkgs, ... }:

{
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      # fcitx5-gtk
      kdePackages.fcitx5-qt
      fcitx5-configtool
      fcitx5-mozc
    ];
  };
}
