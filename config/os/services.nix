{ options, lib, ... }:
{
  options.my.os.services = {
    kdeconnect.enable = lib.mkEnableOption "Whether to enable KDE Connect.";
    kclock.enable = lib.mkEnableOption "Weather to enable K Clock";
    printing.enable = lib.mkEnableOption "Whether to enable printing.";
  };
}
