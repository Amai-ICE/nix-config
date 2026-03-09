{ config, lib, pkgs, ... }:
let cfg = config.my.home.webBrowser ; in
{
  home.packages = with pkgs; [
    (lib.mkIf cfg.firefox.enable firefox)
  ];
}