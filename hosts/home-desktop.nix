{ pkgs, ... }:
{
  home.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;

  my.home = {
    noctaliashell.enable = true;

    windowManager = {
      niri.enable = true;
    };

    terminal = {
      decoration = {
        enable = true;
        starship.enable = true;
      };
      shell = {
        type = "fish";
      };
    };

    fonts = {
      enable = true;
      preferredFonts = with pkgs; [
        source-han-code-jp
        noto-fonts-color-emoji
        nerd-fonts.jetbrains-mono
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
      ];
      fontconfig = {
        defaultFonts = {
          sansSerif = [ "Noto Sans CJK JP" ];
          nerdmono = [ "JetBrainsMono Nerd Font" ];
          emoji = [ "Noto Color Emoji" ];
        };
      };
    };

    development = {
      vscode = {
        enable = true;
        extensions = {
          nixIDE = true;
        };
      };
      direnv.enable = true;
      git.enable = true;
      gh.enable = true;
      lazygit.enable = true;
      nixvim.enable = true;
      unityhub.enable = true;
      nixfmt.enable = true;
      jetbrains = {
        enable = true;
        products = with pkgs; [
          jetbrains.idea
          jetbrains.rust-rover
          jetbrains.rider
          androidStudioPackages.dev
        ];
      };
    };

    art = {
      krita.enable = true;
      gimp.enable = true;
      blender.enable = true;
    };

    daw = {
      reaper.enable = true;
      openutau.enable = true;
      vital.enable = true;
    };

    game = {
      prismlauncher = {
        enable = true;
        jdks = with pkgs; [
          zulu8
          zulu17
          zulu21
          zulu25
        ];
      };
    };

    recording = {
      obsStudio.enable = true;
      gpu-screen-recorder.enable = true;
    };

    fileManager = {
      dolphin.enable = true;
    };

    webBrowser.firefox.enable = true;
    communication.discord.enable = true;

    media = {
      pavucontrol.enable = true;
      yt-dlp.enable = true;
      vlc.enable = true;
      jellyfinTUI.enable = true;
    };

    theme = {
      qt.enable = true;
      gtk.enable = true;
      style = "Breeze-Dark";
    };
  };
}
