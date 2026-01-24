{ lib, config, ... }:
{
  config = lib.mkIf config.my.os.networkmanager.enable {
    networking.networkmanager = {
      enable = true;
    };
  };
}
