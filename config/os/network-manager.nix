{ lib, ... }:
{
  options.my.os.networkmanager.enable = lib.mkEnableOption "network-manager";
}
