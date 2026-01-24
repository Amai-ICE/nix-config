# 設計メモ
1. ディレクトリ運用
    1. config/
        - 基本はoptionのみを記述する
        - 他のコンフィグをmkDefaultでtrueにすることもOK
        - 実装(`services.*`, `programs.*`)は書かない

    2. os/
        - NixOS固有の設定のみを記述する
        - `services.*` `programs.*` `hardware.*` `boot.*` 等
        - `lib.mkIf <cfg>.enable { ... }`以外に設定を記述してはならない
        - options/host/homeの設定は書かない

    3. home/
        - ユーザー側の環境設定のみ記述
        - `home.packages` `programs.*` 等
        - `lib.mkIf <cfg>.enable { ... }`以外に設定を記述してはならない
        - options/host/osの設定は書かない

    4. hosts/
        - マシン固有の設定を書く
        - `my.*.enable`の切替はOK
        - `networking.hostName` `username`などの設定もOK
        - `programs.*`などの設定はダメ
        - `my`以外の`*.enable`もダメ

2. default.nixの規則
    - `default.nix`は他ファイルのインポート専用
    - `imports = [];`以外のコードは書いてはならない。

ダメなやつ
```nix
{
  import = [./some.nix];
  environment.packages = with pkgs; [hogefuga];
}
```

いいやつ
```nix
let cfg = config.ice.os;
in {
    options.ice.os = {
        enable = lib.mkEnableOption "os config";

        xserver ...
    };
}
```

