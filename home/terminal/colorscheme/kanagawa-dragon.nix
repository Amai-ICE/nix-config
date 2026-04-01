{ config, lib, ... }:
let
  c0 = {
    primary = "#181616";
    secondary = "#c5c9c5";
  };
  c1 = {
    primary = "#e6c384";
    secondary = "#c4b28a";
  };
  c2 = {
    primary = c1.secondary;
    secondary = "#87a987";
  };
  c3 = {
    primary = c2.secondary;
    secondary = "#8a9a7b";
  };
  c4 = {
    primary = c3.secondary;
    secondary = "#e46876";
  };
  c5 = {
    primary = c4.secondary;
    secondary = "#7aa89f";
  };
  cfg = config.my.home.terminal.decoration.style.theme;
in
{
  config = lib.mkIf (cfg == "kanagawa-dragon") {
    my.home.terminal.decoration.style.color = {
      inherit
        c0
        c1
        c2
        c3
        c4
        c5
        ;
    };
  };
}
