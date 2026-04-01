{ options, ... }:
{
  imports = [
    ./theme.nix
    ./record.nix
    ./noctaliashell.nix
    ./media.nix
    ./home-manager.nix
    ./game.nix
    ./fonts.nix
    ./fileManager.nix
    ./development.nix
    ./daw.nix
    ./communication.nix
    ./browser.nix
    ./art.nix
    ./i18n.nix
    ./windowManager.nix

    ./terminal/default.nix
  ];
}
