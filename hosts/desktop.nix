{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./common/network-profiles.nix
    ../hardware-configuration.nix
  ];

  networking.hostName = "nixos";
  time.timeZone = "Asia/Tokyo";
  users.users.amaiice = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "realtime"
      "input"
      "adbusers"
      "networkmanager"
    ];
  };

  services.getty.autologinUser = "amaiice";

  my.os = {
    systemd-boot.enable = true;
    networkmanager = true;
  };
}
