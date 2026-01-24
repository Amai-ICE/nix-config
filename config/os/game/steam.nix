{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.my.os.game.steam = {
    enable = lib.mkEnableOption "Steam support";
  };

  config = lib.mkIf config.my.os.game.steam.enable {
    my.os.game.gamescope = lib.mkDefault true;
    my.os.game.gamemode = lib.mkDefault true;

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
