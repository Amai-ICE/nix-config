{ options, lib, ... }:
{
  options.my.home.terminal.decoration = {
    enable = lib.mkEnableOption "Enable terminal decorations";
    fish.enable = lib.mkEnableOption "Enable fish shell";
    fastfetch.enable = lib.mkEnableOption "Enable fastfetch";
    starship.enable = lib.mkEnableOption "Enable starship";
    direnv.enable = lib.mkEnableOption "Enable direnv integration";
  };
}
