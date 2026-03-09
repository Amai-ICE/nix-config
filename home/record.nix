{ config, lib, pkgs, ... }:
let cfg = config.my.home.recording ; in
{
  home.packages = with pkgs; [
    (lib.mkIf cfg.obsStudio.enable obs-studio)
    (lib.mkIf cfg.gpu-screen-recorder.enable gpu-screen-recorder)
  ];
}