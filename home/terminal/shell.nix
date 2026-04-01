{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.terminal.shell;
in
{
  # enableFishIntegrationはenableShellIntegrationでグローバルに有効化されているので多分いらない
  #home.shell.enableFishIntegration = lib.mkIf cfg.fish.enable true;
  config = {
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
    my.home.bashrc.fishIntegration = cfg.fish.enable;
  };
}
