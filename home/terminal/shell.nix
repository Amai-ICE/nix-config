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
  programs.bash = {
    enable = true;
    bashrcExtra = lib.mkMerge [
      (lib.mkIf cfg.fish.enable ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '')
    ];
  };
}
