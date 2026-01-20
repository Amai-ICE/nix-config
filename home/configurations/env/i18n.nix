{ pkgs, ... }:
{
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      libsForQt5.fcitx5-qt
      kdePackages.fcitx5-qt
      qt6Packages.fcitx5-configtool
    ];
  };
  # source form https://zenn.dev/link/comments/5827d19c893ee0
  home.sessionVariables = {
    QT_IM_MODULE = "fcitx qutebrowser";
  };
}
