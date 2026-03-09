{ config, lib, ... }:
let cfg = config.my.os.displayManager; in
{
  config.services.displayManager = {
    ly.enable = cfg.ly.enable;
  };
}