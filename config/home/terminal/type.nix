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
}
