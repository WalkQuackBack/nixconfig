{ pkgs, ... }:

{
  programs.plasma = {
    enable = true;
    overrideConfig = true;

    workspace = {
        colorScheme = "BreezeDark";
        cursor = {
          cursorFeedback = "None";
          size = 16;
          theme = "breeze_cursors";
        };

        wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/DarkestHour/contents/images/2560x1600.png";
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
        opacity = "translucent";
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.panelspacer"
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
          "org.kde.plasma.digitalclock"
        ];
      }
    ];
  };
}