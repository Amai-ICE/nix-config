{ lib, pkgs, ... }:

{
  qt = {
    enable = true;

    platformTheme = "qtct";
    style = {
      name = "fusion";
    };
  };
  home = {
    packages = with pkgs; [
      kdePackages.qt6ct
      kdePackages.qtstyleplugin-kvantum
    ];

    sessionVariables = {
      QT_QPA_PLATFORMTHEME = lib.mkForce "qt6ct";
      QT_STYLE_OVERRIDE = "fusion";
    };

  };
}
