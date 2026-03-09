# NixOS設定 - AIコーディングガイドライン

## プロジェクト概要
これは厳密な関心の分離を備えたFlakesを使用したモジュラーNixOS設定です:
- **config/**: オプション定義のみ（設定できる内容の宣言）
- **os/**: システム実装（実際のサービス、ドライバ、ブート設定）
- **home/**: ユーザー環境（home-manager設定）
- **hosts/**: マシン固有の設定（hostName、ユーザー、有効な機能）

## 重要なディレクトリ構造ルール

### `/config/os/` - オプション宣言のみ
- **含むべき内容**: `lib.mkEnableOption`または`lib.mkOption`付きの`options.my.os.<feature> = { ... }`
- **含んではいけない内容**: `config.*`ブロック、`services.*`、`programs.*`、`hardware.*`の実装
- **構造**: 各機能は独自のファイルを取得（例：`boot.nix`、`network.nix`、`game.nix`）
- **パターン**:
  ```nix
  { options, lib, ... }:
  {
    options.my.os.boot = {
      systemd-boot.enable = lib.mkEnableOption "systemd-bootを有効化";
      nvidiaKernelModule.enable = lib.mkEnableOption "initrdでNVIDIAを有効化";
    };
  }
  ```

### `/os/` - 実装のみ
- **含むべき内容**: `/config/os/`で宣言されたオプションを実装する`config.*`ブロック
- **使用する内容**: `lib.mkIf cfg.<option>.enable { ... }`で条件付き適用
- **参照する内容**: ファイル開始時に`let cfg = config.my.os.<feature>; in`
- **例**: `boot.nix`、`network.nix`、`graphic.nix`は実際のNixOS設定を含む
- **パターン**:
  ```nix
  { lib, config, ... }:
  let cfg = config.my.os.boot; in {
    config.boot = lib.mkIf cfg.systemd-boot.enable {
      loader.systemd-boot.enable = true;
    };
  }
  ```

### `/home/` - ユーザー環境のみ
- `/os/`に類似しているがユーザーレベルの設定用（home-manager）
- `home.packages`、`programs.<app>`設定を使用
- システム設定や他のレイヤーで定義されたオプションを変更しない

### `/hosts/` - マシン固有トグルのみ
- **できること**: `my.os.<feature>.enable = true|false`で機能を有効/無効に設定
- **できること**: `networking.hostName`、`users.users."username"`、ロケール設定を定義
- **できないこと**: `programs.*`、`services.*`などの実装詳細を追加
- **できないこと**: `my.*`以外の有効化オプションを直接変更

## カスタムネームスペースパターン: `my.*`

すべてのカスタムオプションは`options.my.<layer>.<feature>`命名を使用:
- `my.os.boot.*` - システムブートオプション
- `my.os.network.*` - ネットワークオプション
- `my.os.game.*` - ゲーム関連オプション
- `my.home.graphic.*` - グラフィックスオプション（注：ユーザー設定用ホームレイヤー）

**重要**: 修正する前に、常にオプションがどのレイヤーに属しているかを確認してください。

## Default.nixルール

すべての`default.nix`は**インポートのみ**を含む必要があります:
```nix
{
  imports = [
    ./submodule1.nix
    ./submodule2.nix
  ];
}
```

❌ **決して** `default.nix`に設定を直接追加しないでください:
```nix
# 間違い - モジュール性を破壊する
{ imports = [...]; environment.packages = [...]; }
```

## モジュール構築ワークフロー

1. **`/config/os/<feature>.nix`にオプションを追加**:
   - `lib.mkEnableOption`または`lib.mkOption`付きの`options.my.os.<name>`を使用

2. **`/os/<feature>.nix`に実装**:
   - `let cfg = config.my.os.<name>; in`でオプションをインポート
   - `lib.mkIf cfg.enable { config.* = ... }`を使用

3. **`/hosts/desktop.nix`で有効化**:
   - `my.os.<feature>.enable = true;`を追加してアクティベート

## Nixでのヌル値チェック

オプション値の場合は`lib.mkIf (! (isNull <value>)) { ... }`を使用:
```nix
# 使用前にnullでないことを確認
config.my.option = lib.mkIf (! (isNull cfg.customPackage)) cfg.customPackage;
```

## ビルドと変更の適用

```bash
# NixOSシステムを再構築
sudo nixos-rebuild switch

# エラーをチェック
nixos-rebuild build 2>&1 | grep -i error

# nix replで式をテスト
nix repl
> (import <nixpkgs> {})
```

## 従うべき一般的なパターン

### 有効化/無効化パターン
```nix
# config/os/feature.nix - 宣言
enable = lib.mkEnableOption "機能の説明";

# os/feature.nix - 条件付き実装
config = lib.mkIf cfg.enable { 
  services.featureName.enable = true;
};
```

### オプションパッケージパターン
```nix
# config/os/feature.nix - 宣言
package = lib.mkOption {
  type = lib.types.nullOr lib.types.package;
  default = null;
  description = "カスタムパッケージ";
};

# os/feature.nix - nullでない場合に使用
config = lib.mkIf (! (isNull cfg.package)) {
  environment.systemPackages = [ cfg.package ];
};
```

## レイヤー分離アンチパターン

❌ **間違い**: `/config/os/`に実装を配置:
```nix
# config/os/wrong.nix - これをしないこと
options.my.os.boot = {
  config.boot.loader.systemd-boot.enable = true;  # 間違い！
};
```

❌ **間違い**: `/os/`にオプションを追加:
```nix
# os/wrong.nix - これをしないこと
options.my.os.boot = { ... };  # 間違い！代わりにconfig/で定義
```

❌ **間違い**: `/hosts/desktop.nix`に直接設定:
```nix
# 間違い - 代わりにmy.*トグルを使用
services.steam.enable = true;
```

## Flake統合

flakeは以下の順序でモジュールをインポート:
1. `./config/home/default.nix` - ホームオプション宣言
2. `./config/os/default.nix` - osオプション宣言
3. `./os/default.nix` - os実装
4. `./hosts/default.nix` - マシン固有の設定
5. `home-manager`モジュールとユーザー設定

**重要**: `/config/`のオプションは、hostsで使用される前に実装される必要があります。

## ファイル命名規則

- `/config/os/`と`/os/`の機能固有ファイルは小文字とハイフンを使用: `display-manager.nix`、`nix-ld.nix`
- ディレクトリは関連機能をグループ化: `./windowManager/niri.nix`
- 各モジュールは自己完結で再利用可能である必要があります

## 設定変更のテスト

```bash
# ビルドせずに構文を検証
nix flake check

# ドライラン（エラーを早期に検出）
nixos-rebuild build --flake .

# 変更内容を確認
nixos-rebuild dry-run

# 検証後に適用
sudo nixos-rebuild switch --flake .
```

## デバッグのコツ

- `nix repl`を使用して式をテスト: `let cfg = config.my.os.boot; in cfg`
- ランタイム問題については`/var/log/syslog`でエラーを確認
- オーバーライド可能なより低い優先度のデフォルトには`lib.mkDefault`を使用
- 注意: `options.*.enable`は`lib.mkEnableOption`からデフォルト`false`を使用します
