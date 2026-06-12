{
  options,
  lib,
  ...
}:
{
  options.my.home.audio = {
    easyeffects.enable = lib.mkEnableOption "Enable Easy Effects.";
  };
}
