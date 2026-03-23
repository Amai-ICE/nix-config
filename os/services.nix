{ config, lib, ... }:
let cfg = config.my.os.services; in {
  services = {
    printing.enable = cfg.printing.enable;
  };

  programs.kdeconnect.enable = cfg.kdeconnect.enable;
}