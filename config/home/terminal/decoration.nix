{ options, lib, ... }:
let
  colorSet = lib.types.submodule {
    options = {
      primary = lib.mkOption { type = lib.types.str; };
      secondary = lib.mkOption { type = lib.types.str; };
    };
  };
in
{
  options.my.home.terminal.decoration = {
    enable = lib.mkEnableOption "Enable terminal decorations";
    starship.enable = lib.mkEnableOption "Enable starship";
  };

  options.my.home.terminal.decoration.style.color = lib.mkOption {
    type = lib.types.submodule {
      options = {
        c0 = lib.mkOption { type = colorSet; };
        c1 = lib.mkOption { type = colorSet; };
        c2 = lib.mkOption { type = colorSet; };
        c3 = lib.mkOption { type = colorSet; };
        c4 = lib.mkOption { type = colorSet; };
        c5 = lib.mkOption { type = colorSet; };
      };
    };
  };
  #TODO
  options.my.home.terminal.decoration.style.type = lib.mkOption {
    type = lib.types.enum [
      "default"
      "powerline"
      "arrow"
    ];
    default = "default";
  };
  options.my.home.terminal.decoration.style.theme = lib.mkOption {
    type = lib.types.enum [
      "kanagawa-dragon"
      "rainbow"
      #"nord"
    ];
    default = "NO-THEME";
  };
}
