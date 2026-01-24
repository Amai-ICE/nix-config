{ lib, ... }:
{
  options.my.os.systemd-boot = {
    enable = lib.mkEnableOption "Enable boot";
  };
}
