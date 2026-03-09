{ options, lib, ... }:
{
  options.my.home.windowManager = {
    niri.enable = lib.mkEnableOption "Enable Niri window manager";
  };
}