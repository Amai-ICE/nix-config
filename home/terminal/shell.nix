{ config, lib, ... }:
let
  cfg = config.my.home.terminal.shell;
in
{
  programs.fish = lib.mkIf cfg.fish.enable {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    ''
    /*
      + lib.optionalString cfg.fastfetch.enable ''
        fastfetch
      ''
    */
    + lib.optionalString config.my.home.terminal.decoration.starship.enable ''
      starship init fish | source
    ''
    /*
      + lib.optionalString cfg.direnv.enable ''
        direnv hook fish | source
      ''
    */
    ;
  };
}
