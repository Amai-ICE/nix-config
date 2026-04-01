{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.os.windowManager.niri;
in
{
  config.environment.systemPackages = [
    (lib.mkIf cfg.enable pkgs.xwayland-satellite)
  ];
  config.programs.niri = lib.mkIf cfg.enable {
    enable = true;
  };

}
