{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.bashrc;
in
{
  programs.bash = {
    enable = true;
    bashrcExtra = lib.mkMerge [
      # ログインシェルがfishではない、かつ対話型シェルの場合にfishを有効化
      (lib.mkIf cfg.fishIntegration ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} && ''$- == *i* ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '')
      # kittyでsshした際に不明なターミナルというエラーが出るため、sshのエイリアスを上書き
      (lib.mkIf cfg.kittyIntegration ''
        [ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
      '')
    ];
  };
}
