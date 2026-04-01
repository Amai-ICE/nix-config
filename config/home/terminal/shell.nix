{ options, lib, ... }:
{
  options.my.home.terminal.shell = {
    type = lib.mkOption {
      type = lib.types.enum [
        "fish"
        "zsh"
      ];
      default = "fish";
      description = "Shell type";
    };
  };
}
