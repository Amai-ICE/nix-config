{ config, lib, pkgs, ... }:
let
  cfg = config.my.os.i18n;
in
{
  config = lib.mkMerge [
    (lib.mkIf cfg.locale.jp {
      i18n.defaultLocale = "ja_JP.UTF-8";
    })

    (lib.mkIf cfg.fcitx5.enable {
      i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5.addons = with pkgs; [
          fcitx5-mozc
          fcitx5-gtk
          qt6Packages.fcitx5-configtool
        ];
      };

      my.home.i18n.fcitx5.enable = lib.mkDefault true;

      environment.variables = {
        GTK_IM_MODULE = "fcitx";
        QT_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
      };
    })
  ];
}