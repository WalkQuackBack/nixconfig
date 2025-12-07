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

    fonts = {
        general = {
            family = "Inter Variable";
            pointSize = 14;
            weight = 400;
        };
        small = {
            family = "Inter Variable";
            pointSize = 12;
            weight = 500;
        };
        toolbar = {
            family = "Inter Variable";
            pointSize = 14;
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
            pointSize = 14;
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