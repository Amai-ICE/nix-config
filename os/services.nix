{ config, lib, ... }:
let cfg = config.my.os.services; in {
  services = {
    printing.enable = cfg.printing.enable;
    ssh.enable = cfg.ssh.enable;
  };

  programs.kdeconnect.enable = cfg.kdeconnect.enable;
}