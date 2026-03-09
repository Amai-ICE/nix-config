{ options, lib, ... }:
{
  options.my.home.home-manager = {
    enable = lib.mkEnableOption "Enable home-manager program";
  };
}
