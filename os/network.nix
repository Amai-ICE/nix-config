{ lib, config, ... }:
let cfg = config.my.os.network; in
{
  config = {
    networking.networkmanager = lib.mkIf cfg.networkmanager.enable {
      enable = true;
    };
    networking.firewall = lib.mkIf cfg.firewall.enable {
      enable = true;
    };
    hardware.bluetooth = lib.mkIf cfg.bluetooth.enable {
      enable = true;
    };

    services.openssh = lib.mkIf cfg.ssh.enable {
      enable = true;
    };
    services.avahi = lib.mkIf cfg.ssh.enable {
      enable = true;
    };
  };
}
