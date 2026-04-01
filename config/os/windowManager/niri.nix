{ options, lib, ... }:
{
  options.my.os.windowManager.niri = {
    enable = lib.mkEnableOption "Enable Niri window manager";
  };
}
