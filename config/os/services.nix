{ options, lib, ... }:
{
  options.my.os.services = {
    printing.enable = lib.mkEnableOption "Whether to enable printing.";
    ssh.enable = lib.mkEnableOption "Whether to enable ssh.";
    };
}