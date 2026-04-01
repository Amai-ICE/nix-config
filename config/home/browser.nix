{ options, lib, ... }:
{
  options.my.home.webBrowser = {
    firefox.enable = lib.mkEnableOption "Enable Firefox";
  };
}
