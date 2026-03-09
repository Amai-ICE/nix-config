{ options, lib, ... }:
{
  options.my.home.i18n = {
    ja.enable = lib.mkEnableOption "Enable Japanese language support";
    fcitx5.enable = lib.mkEnableOption "Enable Fcitx5 input method framework";
  };
}