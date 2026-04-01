{ config, lib, pkgs, ... }:
let
  cfg = config.my.home.terminal;
in
{
    programs = 
      lib.mkMerge [
        (lib.mkIf (cfg.type == "kitty") {
          kitty = {
            enable = true;
              shellIntegration.enableFishIntegration = cfg.decoration.fish.enable;
              
            font.name =
        if config.my.home.fonts.enable && config.my.home.fonts.fontconfig.defaultFonts.nerdmono != [ ]
        then builtins.head config.my.home.fonts.fontconfig.defaultFonts.nerdmono
        else "monospace";

      
      settings = {
        background_opacity = 0.65;
        dynamic_background_opacity = "yes";
      };
          };

        })
        (lib.mkIf (cfg.type == "alacritty") {
          alacritty.enable = true;
        })
      ];
}