{ options, lib, ... }:
{
  options.my.os.security = {
    polkit.enable = lib.mkEnableOption "Whether to enable polkit.";
    sudo.enable = lib.mkEnableOption "Whether to enable sudo.";
  };
}
