{ config, lib, ... }:
let
  cfg = config.my.os.xserver;
in
{
  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;
      layout = cfg.layout;
      xkb.layout = cfg.xkb.layout;
    };
    services.xserver.videoDrivers = lib.mkIf cfg.nvidiacompability.enable [ "nvidia" ];
  };
}
