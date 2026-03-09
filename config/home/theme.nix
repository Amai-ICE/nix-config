{ options, lib, ... }:
{
  options.my.home.theme = {
    qt.enable = lib.mkEnableOption "Enable Qt theming";
    gtk.enable = lib.mkEnableOption "Enable GTK theming";
    style = lib.mkOption {
      type = lib.types.str;
      default = "Breeze-Dark";
      description = "Theme style name";
    };
  };
}
