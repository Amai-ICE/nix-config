{ options, lib, ... }:
{
  options.my.home.terminal.shell = {
    type = lib.mkOption {
      type = lib.types.enum [
        "fish"
        "zsh"
      ];
      default = "#EMPTY#";
      description = "Shell type";
    };
  };
}
