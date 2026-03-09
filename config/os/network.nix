{ options, lib, ... }:
{
  options.my.os.network = {
    networkmanager = {
      enable = lib.mkEnableOption "Enable NetworkManager for network management";
    };
    firewall = {
      enable = lib.mkEnableOption "Enable firewall service";
    };
    ssh = {
      enable = lib.mkEnableOption "Enable OpenSSH service";
    };
    bluetooth = {
      enable = lib.mkEnableOption "Enable Bluetooth support";
    };
  };
}
