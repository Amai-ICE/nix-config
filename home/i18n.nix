{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.i18n;
in
{
  home.packages = lib.optionals cfg.fcitx5.enable [
    pkgs.fcitx5
  ];

  home.sessionVariables = lib.mkIf cfg.fcitx5.enable {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    INPUT_METHOD = "fcitx";
    SDL_IM_MODULE = "fcitx";
  };
}
