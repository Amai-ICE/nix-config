{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.theme;
in
{

  qt = {
    enable = cfg.qt.enable;
    platformTheme.name = "kde6";

    style = {
      name = cfg.style;

      package = lib.mkIf (cfg.style == "Breeze-Dark") pkgs.kdePackages.breeze;
    };
  };

  gtk = {
    enable = cfg.gtk.enable;

    theme = {
      name = cfg.style;

      package = lib.mkIf (cfg.style == "Breeze-Dark") pkgs.kdePackages.breeze-gtk;
    };
  };

}
