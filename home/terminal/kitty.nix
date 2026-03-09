{ config, lib, ... }:
let
  cfg = config.my.home.terminal.kitty;
in
{
    programs.kitty = lib.mkIf cfg.enable {
      enable = true;
      #fontSize = cfg.fontSize;
      font.name =
        if config.my.home.fonts.enable && config.my.home.fonts.fontconfig.defaultFonts.nerdmono != [ ]
        then builtins.head config.my.home.fonts.fontconfig.defaultFonts.nerdmono
        else "monospace";

      shellIntegration.enableFishIntegration = config.my.home.terminal.decoration.fish.enable;
      settings = {
        background_opacity = 0.65;
        dynamic_background_opacity = "yes";
      };
    };
}