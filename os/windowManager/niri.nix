{ config, lib, ... }:
let cfg = config.my.os.windowManager.niri; in
{
  config = lib.mkIf cfg.enable {
    programs.niri = {
      enable = true;
    };
  };
}