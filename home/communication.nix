{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.communication;
in
{
  home.packages = with pkgs; [
    (lib.mkIf cfg.discord.enable discord)
  ];
}
