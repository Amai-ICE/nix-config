{ lib, config, ... }:
{
  config = lib.mkIf config.my.os.game.gamemode.enable {
    programs.gamemode.enable = true;
  };
}
