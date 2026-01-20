{ inputs, pkgs, ... }:
{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell = {
    enable = true;

    settings = {
      bar = {
        density = "default";
        backgroundOpacity = 0.20;
        position = "top";
        showCapsule = false;
        widgets = {
          left = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "none";
            }
            { id = "ActiveWindow"; }
          ];

          center = [
            { id = "MediaMini"; }
          ];
          right = [
            { id = "Tray"; }
            { id = "NotificationHistory"; }
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }

            {
              id = "Clock";
              formatHorizontal = "yyyy/MM/dd HH:mm";
              formatVertical = "HH:mm";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
            {
              id = "ControlCenter";
            }
          ];
        };
      };
      wallpaper = {
        enabled = true;
        overviewEnabled = true;
        directory = "~/wallpaper/";
      };
      colorSchemes.predefinedScheme = "Kanagawa";
      general = {
        avatarImage = "/home/amaiice/.face";
        radiusRatio = 0.2;
      };
      location = {
        monthBeforeDay = true;
        name = "Japan,";
      };
      notifications = {
        enabled = true;
        location = "top_right";
        overlayLayer = true;
        backgroundOpacity = 1;
        respectExpireTimeout = false;
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        criticalUrgencyDuration = 15;
        enableKeyboardLayoutToast = true;
        enableMediaToast = true;
        saveToHistory = {
          low = true;
          normal = true;
          critical = true;
        };
        sounds = {
          excluededApps = "discord,firefox";
        };
      };

      audio = {
        preferredPlayer = "mpv";
        mprisBlacklist = [ "firefox" ];
      };
    };

    # noctalia daemon.
    systemd.enable = true;
  };

}
