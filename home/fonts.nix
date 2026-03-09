{ config, lib, ... }:
let cfg = config.my.home.fonts; in
{
  
  home.packages = lib.mkIf cfg.enable cfg.preferredFonts;
  
  fonts.fontconfig = lib.mkIf cfg.enable {
      enable = true;
      defaultFonts = {
        sansSerif = cfg.fontconfig.defaultFonts.sansSerif;
        monospace = cfg.fontconfig.defaultFonts.nerdmono;
        emoji = cfg.fontconfig.defaultFonts.emoji;
      };
    };
}