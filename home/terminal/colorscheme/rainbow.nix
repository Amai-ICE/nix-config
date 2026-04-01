{ config, lib, ... }:
let
  c0 = {
    primary = "#ffdb93";
    secondary = "#FFFFFF";
  };
  c1 = {
    primary = "#7d4b4b";
    secondary = "#46764c";
  };
  c2 = {
    primary = c1.secondary;
    secondary = "#4e8b73";
  };
  c3 = {
    primary = c2.secondary;
    secondary = "#4e6e8e";
  };
  c4 = {
    primary = c3.secondary;
    secondary = "#50456e";
  };
  c5 = {
    primary = c4.secondary;
    secondary = "#634d6a";
  };
  cfg = config.my.home.terminal.decoration.style.theme;
in
{
  config = lib.mkIf (cfg == "rainbow") {
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
