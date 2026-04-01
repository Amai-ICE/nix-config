{ config, lib, ... }:
let
  cfg = config.my.home.terminal.decoration;
  formatcharacter = "🮍";
  colorscheme = config.my.home.terminal.decoration.style.color;

  programColorscheme = "fg:${colorscheme.c0.primary} bg:${colorscheme.c3.primary}";

  section1 = "$directory[](fg:${colorscheme.c1.primary} bg:${colorscheme.c1.secondary})";
  section2 = "[$git_branch$git_status$hg_branch](bg:${colorscheme.c1.secondary})[](fg:${colorscheme.c2.primary} bg:${colorscheme.c2.secondary})";
  section3 = "[$c$cpp$cmake$dart$dotnet$golang$haskell$java$kotlin$gradle$lua$nodejs$perl$php$python$ruby$rust$scala$swift$zig](bg:${colorscheme.c2.secondary})[](fg:${colorscheme.c2.secondary})";
  section4 = "$fill";
  section5 = "[](fg:${colorscheme.c4.secondary})$cmd_duration[](bg:${colorscheme.c5.primary} fg:${colorscheme.c5.secondary})$time";
  section6 = "$os[](fg:${colorscheme.c1.primary} bg:${colorscheme.c1.secondary})[$username@$hostname](bg:${colorscheme.c2.primary})[](fg:${colorscheme.c2.primary} bg:${colorscheme.c2.secondary})";
  section7 = "$sudo[](fg:${colorscheme.c3.primary})";
in
{
  imports = [
    ./colorscheme/colors.nix
  ];
  config = lib.mkIf cfg.enable {
    programs.starship = lib.mkIf cfg.starship.enable {
      enable = true;
      settings = {
        format = ''
          ${section1}${section2}${section3}${section4}${section5}
          ${section6}${section7}
        '';

        fill = {
          symbol = " ";
        };
        git_branch = {
          style = "bold fg:${colorscheme.c0.primary} bg:${colorscheme.c1.secondary}";
        };
        git_status = {
          style = "bold fg:${colorscheme.c0.primary} bg:${colorscheme.c1.secondary}";
          staged = "[󰸩 +\($count\)](fg:${colorscheme.c0.primary} bg:${colorscheme.c1.secondary})";
          modified = "󱞂 ";
          stashed = "󰆧 ";
          ahead = " [$count](bold fg:${colorscheme.c0.primary} bg:${colorscheme.c1.secondary})";
          behind = " [$count](bold fg:${colorscheme.c0.primary} bg:${colorscheme.c1.secondary})";
        };
        hg_branch = {
          style = "bold fg:${colorscheme.c0.primary} bg:${colorscheme.c1.secondary}";
        };
        sudo = {
          disabled = false;
          style = "fg:${colorscheme.c0.primary} bg:${colorscheme.c3.primary}";
          format = "[󱐋sudo󱐋]($style)";
        };
        directory = {
          fish_style_pwd_dir_length = 1;
          style = "fg:${colorscheme.c0.secondary} bg:${colorscheme.c1.primary}";
          read_only_style = "fg:${colorscheme.c0.primary} bg:${colorscheme.c1.primary}";
          read_only = "";
          format = "[ $read_only]($read_only_style)[ $path ]($style)";
        };
        username = {
          style_user = "${colorscheme.c0.primary} bg:${colorscheme.c2.primary}";
          style_root = "red fg:bold bg:${colorscheme.c2.primary}";
          format = "[$user]($style)";
          show_always = true;
        };

        cmd_duration = {
          disabled = false;
          show_milliseconds = true;
          format = "[ $duration ]($style)";
          style = "bold fg:${colorscheme.c0.primary} bg:${colorscheme.c4.secondary}";
        };

        time = {
          disabled = false;
          format = "[ $time ]($style)";
          style = "bold fg:${colorscheme.c0.primary} bg:${colorscheme.c5.secondary}";
        };

        hostname = {
          ssh_only = false;
          format = "[$ssh_symbol$hostname](bold fg:white bg:${colorscheme.c2.primary})";
        };

        os = {
          disabled = false;
          format = "[ ]($style)";
          style = "bold fg:cyan bg:${colorscheme.c1.primary}";
        };

        ### PROGRAMMING LANGUAGES ###
        c = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version(-$name))]($style)";
        };
        cpp = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version(-$name))]($style)";
        };
        cmake = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version)]($style)";
        };
        dart = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version)]($style)";
        };
        dotnet = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version)]($style)";
        };
        golang = {
          style = programColorscheme;
          symbol = "󰟓 ";
          format = "[$symbol($version)]($style)";
        };
        haskell = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version)]($style)";
        };
        java = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version)]($style)";
        };
        kotlin = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version)]($style)";
        };
        gradle = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version)]($style)";
        };
        lua = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version)]($style)";
        };
        nodejs = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version)]($style)";
        };
        perl = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version)]($style)";
        };
        php = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version)]($style)";
        };
        python = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version)]($style)";
        };
        ruby = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version)]($style)";
        };
        rust = {
          style = programColorscheme;
          symbol = "󱘗 ";
          format = "[$symbol($version)]($style)";
        };
        scala = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version)]($style)";
        };
        swift = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version)]($style)";
        };
        zig = {
          style = programColorscheme;
          symbol = " ";
          format = "[$symbol($version)]($style)";
        };
      };
    };
  };
}
