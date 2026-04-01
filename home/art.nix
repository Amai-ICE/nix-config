{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.art;
in
{
  home.packages = with pkgs; [
    (lib.mkIf cfg.krita.enable krita)
    (lib.mkIf cfg.gimp.enable gimp)
    (lib.mkIf cfg.blender.enable blender)
  ];
}
