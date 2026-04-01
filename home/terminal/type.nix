{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.terminal;
in
{
  config = lib.mkMerge [
    (lib.mkIf (cfg.type == "kitty") {
      programs.kitty = {
        enable = true;
        shellIntegration.enableFishIntegration = cfg.shell.type == "fish";

        font.name =
          if config.my.home.fonts.enable && config.my.home.fonts.fontconfig.defaultFonts.nerdmono != [ ] then
            builtins.head config.my.home.fonts.fontconfig.defaultFonts.nerdmono
          else
            "monospace";

        settings = {
          background_opacity = 0.65;
          dynamic_background_opacity = "yes";
        };
      };
      # SSHのエイリアスを上書きする用
      my.home.bashrc.kittyIntegration = true;
    })
    (lib.mkIf (cfg.type == "alacritty") {
      programs.alacritty.enable = true;
    })
  ];
}
