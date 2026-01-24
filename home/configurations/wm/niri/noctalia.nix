{ inputs, pkgs, ... }:
{
  imports = [ inputs.noctalia.homeModules.default ];
  
  home.packages = with pkgs; [
    gpu-screen-recorder
  ];
  programs = {
    noctalia-shell = {
      enable = true;

      plugins = {
        states = {
          screen-recorder = {
            enabled = true;
            sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
          };
        };
        version = 1;
      };

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
            ];

            center = [
              {
                id = "ActiveWindow";
                hideMode = "visible";
                maxWidth = 600;
                #useFixedWidth = true;
              }
            ];
            right = [
              {
                id = "MediaMini";
                compactMode = false;
                compactShowAlbumArt = true;
                compactShowVisualizer = false;
                hideMode = "visible";
                hideWhenIdle = false;
                maxWidth = 200;
                panelShowAlbumArt = true;
                panelShowVisualizer = true;
                scrollingMode = "always";
                showAlbumArt = true;
                showArtistFirst = true;
                showProgressRing = true;
                showVisualizer = true;
                useFixedWidth = true;
                visualizerType = "linear";
              }

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
                formatHorizontal = "HH:mm";
                formatVertical = "HH:mm";
                tooltipFormat = "yyyy年MMMdd日ddd曜日 HH時mm分ss秒";
                useMonospacedFont = true;
                usePrimaryColor = true;
              }
              {
                id = "ControlCenter";
                useDistroLogo = true;
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
          firstDayOfWeek = 0;
          analogClockInCalendar = true;
          monthBeforeDay = false;
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
        controlCenter = {
          shortcuts = {
            right = [
              {
                id = "plugin:screen-recorder";

                "defaultSettings" = {
                  "audioCodec" = "opus";
                  "audioSource" = "default_output";
                  "colorRange" = "limited";
                  "copyToClipboard" = false;
                  "directory" = "";
                  "filenamePattern" = "recording_yyyyMMdd_HHmmss";
                  "frameRate" = "60";
                  "quality" = "very_high";
                  "resolution" = "original";
                  "showCursor" = true;
                  "videoCodec" = "h264";
                  "videoSource" = "portal";
                };
              }
            ];
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
  };
}
