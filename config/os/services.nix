{ options, lib, ... }:
{
  options.my.os.services = {
    kdeconnect.enable = lib.mkEnableOption "Whether to enable KDE Connect.";
    printing.enable = lib.mkEnableOption "Whether to enable printing.";
  };
}