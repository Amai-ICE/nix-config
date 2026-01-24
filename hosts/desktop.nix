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

  my.os = {
    systemd-boot.enable = true;
    networkmanager.enable = true;
  };
}
