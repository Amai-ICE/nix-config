# ittann tundanode idou
{ config, lib, pkgs, ... }:

{
  networking.hostName = "nixos";
  users.users."amaiice" = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "realtime"
      "input"
      "adbusers"
      "networkmanager"
    ];
  };

  #日本人向け設定.
  i18n.defaultLocale = "ja_JP.UTF-8";
  console.keyMap = "jp106";
  time.timeZone = "Asia/Tokyo";
}