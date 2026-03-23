{
  config,
  lib,
  pkgs,
  ...
}:
{
  system.stateVersion = "25.05";
    networking.hostName = "nixos";
  users.users."amaiice" = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "realtime"
      "input"
      "adbusers"
      "networkmanager"
    ];
  };

  #日本人向け設定.
  i18n.defaultLocale = "ja_JP.UTF-8";
  console.keyMap = "jp106";
  time.timeZone = "Asia/Tokyo";

  # config/の要素を有効化
  my.os = {
    pipewire = {
      enable = true;
      pulseAudioSupport = true;
    };
    nix = {
      enable = true;
      allowUnfree = true;
      allowExperimentalFeatures = true;
      autoOptimiseStore = true;
      nh = {
        enable = true;
        clean = {
          enable = true;
          cleanupGarbageAfterDays = 7;
          keepOldGenerations = 3;
        };
        flake = "/home/amaiice/.nixos_confg";
      };
    };

    graphic = {
      enable = true;
      nvidia = {
        enable = true;
        openSourceDriver = false;
        nvidiaSettings = true;
        modesetting.enable = true;
        kernelModule.enable = true;
        package = config.boot.kernelPackages.nvidiaPackages.beta;
      };
    };

    services = {
      printing.enable = true;
      kdeconnect.enable = true;
    };

    security = {
      sudo.enable = true;
      polkit.enable = true;
    };

    boot = {
      kernelPackage = pkgs.linuxPackages_xanmod;
      systemd-boot.enable = true;
      useSystemdInitrd = true;
    };

    network = {
      bluetooth.enable = true;
      firewall.enable = true;
      ssh.enable = true;
      networkmanager.enable = true;
    };

    displayManager = {
      ly.enable = true;
    };
    windowManager = {niri.enable = true;};

    game = {
      steam = { enable = true; openFirewall = true; };
      lutris.enable = true;
      wivrn = { enable = true; cudaSupport = true; openFirewall = true; autoStart = true; };
    };

    xserver = {
      enable = true;
    };
    nix-ld = {
      enable = true;
      allowReplaceLDLibraryPath = false;
    };
    i18n = {
      locale.jp = true;
      fcitx5.enable = true;
      };
  };
/*
  my.home = {
    noctaliashell.enable = true;

    windowManager = {
      niri.enable = true;
    };

    terminal = {
      decoration = {
        fish.enable = true;
        starship.enable = true;
      };
      kitty.enable = true;
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
          sansSerif = "Noto Sans CJK JP";
          nerdmono = "JetBrainsMono Nerd Font";
          emoji = "Noto Color Emoji";
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
      jetbrains = {
        enable = true;
        products = with pkgs; [
          jetbrains.idea
          jetbrains.rust-rover
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
        jdks = with pkgs; [ zulu8 zulu17 zulu21 zulu25 ];
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
  };*/
}
