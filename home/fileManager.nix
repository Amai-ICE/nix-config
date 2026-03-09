{ config, lib, pkgs, ... }:
let
  cfg = config.my.home.fileManager;
in
{
  home.packages = with pkgs;
   [ (lib.mkIf cfg.dolphin.enable kdePackages.dolphin) ];
}