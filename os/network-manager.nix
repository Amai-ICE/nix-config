{ lib, config, ... }:
{
  config = lib.mkIf config.my.os.network-manager.enable {
    networking.networkmanager = {
      enable = true;
    };
  };
}
