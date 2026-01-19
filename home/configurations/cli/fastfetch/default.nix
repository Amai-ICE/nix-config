{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "data";
        source = ''
          $1         ◢███◣       $2◥████◣    ◢███◣
          $1         ◥████◣       $2◥████◣  ◢████◤
          $1          ◥████◣       $2◥████◣◢████◤
          $1           ◥████◣       $2◥████████◤
          $1     ◢█████████████████◣ $2◥██████◤    $1◢█◣
          $1    ◢███████████████████◣ $2◥█████    $1◢███◣
          $2                           $2◥████◣ $1 ◢████◤
          $2          ◢████◤            $2◥███◤ $1◢████◤
          $2         ◢████◤              $2◥█◤ $1◢████◤
          $2◢████████████◤                  $1◢██████████◣
          $2◥███████████◤                  $1◢███████████◤
          $2      ◢████◤ $1◢█◣              ◢████◤
          $2     ◢████◤ $1◢███◣            ◢████◤
          $2    ◢████◤  $1◥████◣           
          $2    ◥███◤    $1█████◣ $2◥██████████████████◤
          $2     ◥█◤    $1◢██████◣ $2◥████████████████◤
          $1           ◢████████◣       $2◥████◣
          $1          ◢████◤◥████◣       $2◥████◣
          $1         ◢████◤  ◥████◣       $2◥████◣
          $1         ◥███◤    ◥████◣       $2◥███◤'';
        color = {
          "1" = "#5176c1";
          "2" = "#7eb7e2";
        };
      };
      display = {
        size = {
          binaryPrefix = "si";
        };
        color = "#7eb7e2";
        separator = "  ";
      };
      modules = [
        {
          type = "custom";
          format = "┌──INFORMATION";
          outputColor = "#7eb7e2";
        }
        {
          type = "title";
          key = "├";
        }
        {
          type = "custom";
          format = "├─┬──SYSTEM";
          outputColor = "#7eb7e2";
        }
        {
          type = "os";
          key = "│ ├ ";
        }
        {
          type = "kernel";
          key = "│ ├";
        }
        {
          type = "packages";
          key = "│ ├󰏗";
        }
        {
          type = "uptime";
          key = "│ ├";
        }
        {
          type = "shell";
          key = "│ ├";
        }
        {
          type = "custom";
          format = "│ └─┬──USER";
          outputColor = "#7eb7e2";
        }
        {
          type = "wm";
          key = "│   ├";
        }
        {
          type = "lm";
          key = "│   ├󰧨";
        }
        {
          type = "locale";
          key = "│   ├";
        }
        {
          type = "localip";
          key = "│   ├󰩟";
          showSpeed = true;
        }
        {
          type = "terminal";
          key = "│   └";
        }
        {
          type = "custom";
          format = "└─┬──HARDWARE";
          outputColor = "#7eb7e2";
        }
        {
          type = "cpu";
          key = "  ├󰻠";
        }
        {
          type = "gpu";
          key = "  ├󱑮";
        }
        {
          type = "btrfs";
          key = "  ├";
        }
        {
          type = "memory";
          key = "  ├󰑭";
        }
        {
          type = "swap";
          key = "  └󰓡";
        }

      ];
    };
  };
}
