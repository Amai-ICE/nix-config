{ options, lib, ...}:
{
  options.my.os.xserver = {
    enable = lib.mkEnableOption "Enable X Server";
    layout = lib.mkOption {
      type = lib.types.str;
      default = "us";
      description = "Keyboard layout for X Server";
    };
    xkb = {
      layout = lib.mkOption {
        type = lib.types.str;
        default = "us";
        description = "XKB keyboard layout";
      };
    };
    nvidiacompability.enable = lib.mkEnableOption "Enable NVIDIA compatibility for X Server";
  };
}