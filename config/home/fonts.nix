{ options, lib, ... }:
{
  options.my.home.fonts = {
    enable = lib.mkEnableOption "Enable font settings";
    preferredFonts = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [];
      description = "Preferred font packages";
    };
    fontconfig.defaultFonts = {
      sansSerif = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        description = "Default sans-serif fonts";
      };
      nerdmono = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        description = "Default monospace fonts";
      };
      emoji = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        description = "Default emoji fonts";
      };
    };
  };
}
