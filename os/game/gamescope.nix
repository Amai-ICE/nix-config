{ lib, config, ... }:
{
  config = lib.mkIf config.my.os.game.gamescope.enable {
    programs.gamescope.enable = true;
  };
}
