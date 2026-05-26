{ options, lib, ... }:
{
  options.my.os.game = {
    steam = {
      enable = lib.mkEnableOption "Enable Steam";
      openFirewall = lib.mkEnableOption "Open firewall for Steam Remote Play, Dedicated Server, and Local Network Game Transfers";
    };
    wivrn = {
      enable = lib.mkEnableOption "Enable Wivrn service for VR support";
      cudaSupport = lib.mkEnableOption "Enable CUDA support in Wivrn package";
      openFirewall = lib.mkEnableOption "Open firewall for Wivrn";
      autoStart = lib.mkEnableOption "Auto start Wivrn service on login";
      wayvr = lib.mkEnableOption "Enable WayVR in Wivrn";
    };
  };
}
