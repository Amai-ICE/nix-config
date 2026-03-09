{ options, lib, ... }:
{
  options.my.home.media = {
    vlc.enable = lib.mkEnableOption "Enable VLC";
    jellyfinTUI.enable = lib.mkEnableOption "Enable jellyfin-tui";
    yt-dlp.enable = lib.mkEnableOption "Enable yt-dlp";
    pavucontrol.enable = lib.mkEnableOption "Enable pavucontrol";
  };
}
