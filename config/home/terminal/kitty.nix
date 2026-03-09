{ options, lib, ... }:
{
  options.my.home.terminal.kitty = {
    enable = lib.mkEnableOption "Enable kitty terminal";
    fontSize = lib.mkOption {
      type = lib.types.int;
      default = 12;
      description = "Kitty font size";
    };
  };
}
