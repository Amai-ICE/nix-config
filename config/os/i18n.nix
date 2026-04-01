{ options, lib, ... }:
{
  options.my.os.i18n = {
    locale = {
      jp = lib.mkEnableOption "Use Japanese locale (ja_JP.UTF-8)";
    };
    fcitx5 = {
      enable = lib.mkEnableOption "Enable fcitx5 input method framework";
    };
  };
}
