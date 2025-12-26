{ pkgs, ... }:
let 
  wallpaper = ../../assets/oceanfoam.png;
in
{
  programs.plasma = {
    enable = true;
    overrideConfig = true;

    workspace = {
        colorScheme = "Material You dark";
        cursor = {
          cursorFeedback = "None";
          size = 16;
          theme = "breeze_cursors";
        };

        wallpaper = "${wallpaper}";
        splashScreen.theme = "None";
    };

    # TODO: Natural scrolling for touchpad

    kwin = {
      effects = {
        blur = {
          enable = true;
          noiseStrength = 8;
          strength = 10;
        };
      };
      nightLight = {
        mode = "times";
        temperature = {
          day = 6500;
          night = 3200;
        };
        time = {
          morning = "04:00";
          evening = "18:00";
        };
        transitionTime = 180;
      };
    };

    fonts = {
        general = {
            family = "Inter Variable";
            pointSize = 14;
            weight = 400;
            letterSpacing = 100;
        };
        small = {
            family = "Inter Variable";
            pointSize = 12;
            weight = 500;
            letterSpacing = 100;
        };
        toolbar = {
            family = "Inter Variable";
            pointSize = 13;
            weight = 400;
            letterSpacing = 95;
        };
        menu = {
            family = "Inter Variable";
            pointSize = 14;
            weight = 400;
        };
        windowTitle = {
            family = "Inter Variable";
            pointSize = 12;
            weight = 400;
            letterSpacing = 95;
        };
    };

    # Roughly inspired by ChromeOS
    panels = [
      {
        location = "left";
        height = 48;
        floating = false;
        opacity = "adaptive";
        widgets = [
          {
            name = "org.kde.plasma.kickoff";
            config = {
              compactMode = true;
              icon = "nix-snowflake";
              primaryActions = 3;
              showActionButtonCaptions = false;
              systemFavorites = "lock-screen\\,logout\\,save-session\\,switch-user\\,suspend\\,hibernate\\,reboot\\,shutdown";
            };
          }
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.notifications"
        ];
      }
      {
        location = "top";
        alignment = "right";
        height = 40;
        lengthMode = "fit";
        hiding = "dodgewindows";
        opacity = "translucent";
        floating = true;
        widgets = [
          "org.kde.plasma.systemtray"
          {
            name = "org.kde.plasma.panelspacer";
            config = {
              expanding = false;
              length = 6;
            };
          }
          # TODO: Maybe use higher level interface?
          {
            name = "org.kde.plasma.digitalclock";
            config = {
              autoFontAndSize = false;
              fontFamily = "Inter Variable";
              fontSize = 11;
              fontStyleName = "Medium";
              fontWeight = 500;
              showSeconds = "Never";
              use24hFormat = 2;
            };
          }
        ];
      }
    ];

    configFile = {
      breezerc = {
        Common = {
          OutlineIntensity = "OutlineLow";
          ShadowSize = "ShadowMedium";
        };

        Windeco = {
          ButtonSize = "ButtonSmall";
          DrawBackgroundGradient = "true";
          TitleAlignment = "AlignLeft";
        };
      };
    };
  };
}