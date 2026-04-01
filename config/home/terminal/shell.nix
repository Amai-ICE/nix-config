{ options, lib, ... }:
{

  options.my.home.terminal.shell = {
    fish.enable = lib.mkEnableOption "Enable fish shell";
  };
}
