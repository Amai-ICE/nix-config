{ options, lib, ... }:
{
  options.my.os.windowManager = {
    niri.enable = lib.mkEnableOption "Enable Niri window manager";
    plasma6.enable = lib.mkEnableOption "Enable KDE Plasma 6";
  };

}
