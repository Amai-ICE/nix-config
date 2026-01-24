{ lib, ... }:
{
  options.my.os.network-manager.enable = lib.mkEnableOption "network-manager";
}
