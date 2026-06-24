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
    (lib.mkIf cfg.discord.enable vesktop)
    (lib.mkIf cfg.cinny.enable cinny-desktop)
  ];
}
