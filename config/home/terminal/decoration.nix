{ options, lib, ... }:
{
  options.my.home.terminal.decoration = {
    enable = lib.mkEnableOption "Enable terminal decorations";
    starship.enable = lib.mkEnableOption "Enable starship";
  };
}
