{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.audio;
in
{
  services = {
    easyeffects = {
      enable = cfg.easyeffects.enable;
    };
  };
}
