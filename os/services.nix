{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.os.services;
in
{
  services = {
    printing.enable = cfg.printing.enable;
  };

  programs.kdeconnect.enable = cfg.kdeconnect.enable;

  environment.systemPackages = lib.mkIf cfg.kdeconnect.enable [
    pkgs.sshfs
    pkgs.sshfs-fuse
  ];
}
