{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.filelight
  ];
  services.kdeconnect = {
    enable = true;
  };
}
