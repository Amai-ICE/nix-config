{ options, lib, ... }:
{
  options.my.home.noctaliashell = {
    enable = lib.mkEnableOption "Enable noctalia shell";
  };
}
