{ options, lib, ... }:
{
  options.my.home.terminal = {
    type = lib.mkOption {
      type = lib.types.enum [
        "kitty"
        "alacritty"
      ];
      default = "kitty";
      description = "Terminal emulator type";
    };
  };
  options.my.home.terminal.kitty = {
    enable = lib.mkEnableOption "Enable kitty terminal";
    fontSize = lib.mkOption {
      type = lib.types.int;
      default = 12;
      description = "Kitty font size";
    };
  };
}
