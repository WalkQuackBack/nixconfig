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

    shortcuts = {
      "com.google.Chrome" = {
        "53585719B19B025CF4ABFF5F729C56CE-open-dashboard" = [ ];
        "53585719B19B025CF4ABFF5F729C56CE-open-dashboard-with-running-scripts" = [ ];
        "53585719B19B025CF4ABFF5F729C56CE-open-new-script" = [ ];
        "53585719B19B025CF4ABFF5F729C56CE-toggle-enable" = [ ];
        "757BF25F81655CFB52717389EC3122D1-addSite" = [ ];
        "757BF25F81655CFB52717389EC3122D1-switchEngine" = [ ];
        "757BF25F81655CFB52717389EC3122D1-toggle" = [ ];
        AE8B425B2EBD43CBB24B4A8AF1A58532-autofill_card = [ ];
        AE8B425B2EBD43CBB24B4A8AF1A58532-autofill_identity = [ ];
        AE8B425B2EBD43CBB24B4A8AF1A58532-autofill_login = [ ];
        AE8B425B2EBD43CBB24B4A8AF1A58532-generate_password = [ ];
        AE8B425B2EBD43CBB24B4A8AF1A58532-lock_vault = [ ];
        EA5240BAFDBA0429571F7DE323020F6B-openManage = [ ];
        EA5240BAFDBA0429571F7DE323020F6B-reload = [ ];
        EA5240BAFDBA0429571F7DE323020F6B-styleDisableAll = [ ];
        FFB46232F737A83A70A1270EAA4EAA56-enter-picker-mode = [ ];
        FFB46232F737A83A70A1270EAA4EAA56-enter-zapper-mode = [ ];
      };

      kwin = {
        "Walk Through Windows" = ["Alt+Tab" ""];
        "Walk Through Windows (Reverse)" = ["Alt+Shift+Tab" ""];
        "Walk Through Windows Alternative" = ["Meta+Tab" ""];
        "Walk Through Windows Alternative (Reverse)" = ["Meta+Shift+Tab" ""];
        "Walk Through Windows of Current Application" = ["Meta+`" "Alt+`"];
        "Walk Through Windows of Current Application (Reverse)" = ["Meta+~" "Alt+~"];
        "Walk Through Windows of Current Application Alternative" = [ ];
        "Walk Through Windows of Current Application Alternative (Reverse)" = [ ];
      };
    };
  };
}