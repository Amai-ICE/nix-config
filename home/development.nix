{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
let
  cfg = config.my.home.development;
in
{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  home.packages =
    (lib.optionals cfg.jetbrains.enable cfg.jetbrains.products)
    ++ (lib.optionals cfg.unityhub.enable [ pkgs.unityhub ])
    ++ (lib.optionals cfg.nixfmt.enable [ pkgs.nixfmt ]);

  programs.vscode = lib.mkIf cfg.vscode.enable {
    enable = true;
    /*
      extensions = [
        # DEFAULT EXTENSIONS
        "GitHub.copilot-chat"
        "MS-CEINTL.vscode-language-pack-ja"

        #lib.mkIf cfg.vscode.extensions.nixIDE("bbenoist.Nix" "jnoortheen.nix-ide" "martinring.nix")
      ];
    */
  };

  programs.direnv.enable = cfg.direnv.enable;
  programs.git.enable = cfg.git.enable;
  programs.gh.enable = cfg.gh.enable;
  programs.lazygit.enable = cfg.lazygit.enable;
  programs.nixvim.enable = cfg.nixvim.enable;
}
