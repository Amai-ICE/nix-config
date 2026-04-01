{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.media;
in
{
  home.packages =
    with pkgs;
    (lib.optionals cfg.vlc.enable [ vlc ])
    ++ (lib.optionals cfg.jellyfinTUI.enable [ jellyfin-tui ])
    ++ (lib.optionals cfg.yt-dlp.enable [ yt-dlp ])
    ++ (lib.optionals cfg.pavucontrol.enable [ pavucontrol ]);
}
