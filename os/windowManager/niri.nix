{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.os.windowManager;
in
{
  config.environment.systemPackages = [
    (lib.mkIf cfg.niri.enable pkgs.xwayland-satellite)
  ];
  config.programs.niri = lib.mkIf cfg.niri.enable {
    enable = true;
  };

  config.services.desktopManager.plasma6.enable = cfg.plasma6.enable;

}
