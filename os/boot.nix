{ lib, config, ... }:
{
  config = lib.mkIf config.my.os.systemd-boot.enable {
    # systemd-bootを有効化.
    boot.loader.systemd-boot.enable = true;
    # boot時に必要な設定をNixに生成させるかどうかの設定.
    # 無いと手動設定しないといけない.
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
