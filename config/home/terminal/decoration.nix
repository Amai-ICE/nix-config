{ options, lib, ... }:
{
  options.my.home.terminal.decoration = {
    enable = lib.mkEnableOption "Enable terminal decorations";
    fish.enable = lib.mkEnableOption "Enable fish shell";
    starship.enable = lib.mkEnableOption "Enable starship";
  };
}
