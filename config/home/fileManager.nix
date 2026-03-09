{ options, lib, ... }:
{
  options.my.home.fileManager = {
    dolphin.enable = lib.mkEnableOption "Enable Dolphin file manager";
  };
}
