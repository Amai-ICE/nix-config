{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.daw;
in
{
  home.packages = with pkgs; [
    (lib.mkIf cfg.vital.enable vital)
    (lib.mkIf cfg.reaper.enable reaper)
    (lib.mkIf cfg.audacity.enable audacity)
    (lib.mkIf cfg.openutau.enable openutau)
  ];
}
