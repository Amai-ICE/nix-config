{ lib, pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "kde6";

    style = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze;
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };
  };
}
