{ config, lib, ... }:
let
  cfg = config.my.home.home-manager;
in
{
  home.stateVersion = "25.05";
  home.username = lib.mkForce "amaiice";
  home.homeDirectory = lib.mkForce "/home/amaiice";
  programs.home-manager.enable = cfg.enable;
}
