{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.my.os.game;
in
{
  config = {
    programs.steam = lib.mkIf cfg.steam.enable {
      enable = true;

      remotePlay.openFirewall = cfg.steam.openFirewall;
      dedicatedServer.openFirewall = cfg.steam.openFirewall;
      localNetworkGameTransfers.openFirewall = cfg.steam.openFirewall;

    };

    services.wivrn = lib.mkIf cfg.wivrn.enable {
      enable = true;

      package = pkgs.wivrn.override {
        cudaSupport = cfg.wivrn.cudaSupport;
      };

      openFirewall = cfg.wivrn.openFirewall;
      autoStart = cfg.wivrn.autoStart;
      config.json = {
        application = [ (lib.mkIf cfg.wivrn.wayvr pkgs.wayvr) ];
      };
    };

    #programs.lutris.enable = lib.mkIf cfg.lutris.enable true;
  };
}
