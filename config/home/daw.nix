{ options, lib, ... }:
{
  options.my.home.daw = {
    vital.enable = lib.mkEnableOption "Enable Vital";
    reaper.enable = lib.mkEnableOption "Enable Reaper";
    audacity.enable = lib.mkEnableOption "Enable Audacity";
    openutau.enable = lib.mkEnableOption "Enable OpenUtau";
  };
}
