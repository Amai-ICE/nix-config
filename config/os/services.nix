{ options, lib, ... }:
let opt = options.my.os.services; in
{
   opt = {
    kdeconnect.enable = lib.mkEnableOption "Whether to enable KDE Connect.";
    printing.enable = lib.mkEnableOption "Whether to enable printing.";
    ssh.enable = lib.mkEnableOption "Whether to enable ssh.";
  };
}