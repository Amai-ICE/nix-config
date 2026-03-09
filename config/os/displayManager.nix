{options, lib, ...}: 
{
  options.my.os.displayManager = {
    ly.enable = lib.mkEnableOption "Enable Ly display manager";
  };
}