{ options, lib, ... }:
{
  options.my.home.art = {
    krita.enable = lib.mkEnableOption "Enable Krita";
    gimp.enable = lib.mkEnableOption "Enable GIMP";
    blender.enable = lib.mkEnableOption "Enable Blender";
  };
}
