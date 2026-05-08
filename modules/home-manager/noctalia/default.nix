{ ... }:
{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      settingsVersion = 0;
      bar = {
        barType = "simple";
        position = "left";
        density = "spacious";
        showOutline = false;
        showCapsule = true;
        capsuleOpacity = 0.8;
        fontScale = 1;
        widgetSpacing = 6;
        contentPadding = 2;
        outerCorners = true;
        widgets = {
          left = [
            {
              id = "Launcher";
              icon = "circle";
            }
            # {
            #   id = "SystemMonitor";
            # }
          ];
          center = [
            {
              id = "Workspace";
              fontWeight = "semibold";
            }
            # {
            #   id = "ActiveWindow";
            # }
          ];
          right = [
            # {
            #   id = "Volume";
            # }
            # {
            #   id = "Brightness";
            # }
            {
              id = "Tray";
              colorizeIcons = true;
              drawerEnabled = false;
            }
            {
              id = "MediaMini";
              showArtistFirst = false;
              showProgressRing = true;
              showVisualizer = false;
            }
            {
              id = "Clock";
              formatVertical = "H mm";
            }
            {
              id = "Battery";
              displayMode = "icon-only";
              showNoctaliaPerformance = true;
              showPowerProfiles = true;
            }
            {
              id = "NotificationHistory";
            }
            {
              id = "ControlCenter";
              icon = "adjustments";
            }
          ];
        };
      };
      general = {
        dimmerOpacity = 0;
        lockOnSuspend = true;
        enableShadows = false;
        enableBlurBehind = true;
        telemetryEnabled = true;
        passwordChars = false;
        autoStartAuth = true;
        allowPasswordWithFprintd = false;
        reverseScroll = false;
        smoothScrollEnabled = true;

        compactLockScreen = false;
        lockScreenAnimations = true;
        showSessionButtonsOnLockScreen = true;
        showHibernateOnLockScreen = true;
        enableLockScreenMediaControls = true;
        enableLockScreenCountdown = true;
        lockScreenCountdownDuration = 10000;
        lockScreenBlur = 0;
        lockScreenTint = 0;
      };
      ui = {
        fontDefault = "Inter Variable";
        fontFixed = "Maple Mono";
        fontDefaultScale = 1;
        fontFixedScale = 1;
        panelsAttachedToBar = true;
        settingsPanelMode = "attached";
        settingsPanelSideBarCardStyle = true;
        panelBackgroundOpacity = 1;
        translucentWidgets = false;
      };
      location = {
        name = "Edmonton";
        weatherEnabled = true;
        weatherShowEffects = true;
        weatherTaliaMascotAlways = false;
        useFahrenheit = false;
        use12hourFormat = false;
        showWeekNumberInCalendar = false;
        showCalendarEvents = true;
        showCalendarWeather = true;
        analogClockInCalendar = true;
        firstDayOfWeek = -1;
        hideWeatherTimezone = false;
        hideWeatherCityName = false;
        autoLocate = true;
      };
      calendar = {
        cards = [
          {
            enabled = true;
            id = "calendar-header-card";
          }
          {
            enabled = true;
            id = "calendar-month-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
        ];
      };
      wallpaper = {
        enabled = true;
        overviewEnabled = true;
        fillMode = "crop";
        transitionType = [
          "fade"
        ];
        panelPosition = "follow_bar";
        overviewBlur = 1;
        overviewTint = 0.5;
        sortOrder = "name";
      };
      appLauncher = {
        enableClipboardHistory = true;
        position = "center";
        viewMode = "grid";
        showCategories = true;
        iconMode = "tabler";
        density = "default";
      };
      controlCenter = {
        position = "close_to_bar_button";
        diskPath = "/";
        shortcuts = {
          left = [
            {
              id = "AirplaneMode";
            }
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "WallpaperSelector";
            }
          ];
          right = [
            # {
            #   id = "Notifications";
            # }
            {
              id = "PowerProfile";
            }
            {
              id = "KeepAwake";
            }
            {
              id = "DarkMode";
            }
            {
              id = "NightLight";
            }
          ];
        };
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = true;
            id = "brightness-card";
          }
          {
            enabled = false;
            id = "weather-card";
          }
          {
            enabled = false;
            id = "media-sysmon-card";
          }
        ];
      };
      noctaliaPerformance = {
        disableWallpaper = true;
        disableDesktopWidgets = true;
      };
      dock = {
        enabled = false;
      };
      sessionMenu = {
        position = "center";
        largeButtonsStyle = false;
        showHeader = false;
        countdownDuration = 3000;
      };
      notifications = {
        enabled = true;
        density = "default";
        location = "top_right";
        backgroundOpacity = 0.95;
        lowUrgencyDuration = 4;
        normalUrgencyDuration = 10;
        criticalUrgencyDuration = 20;
        saveToHistory = {
          low = true;
          normal = true;
          critical = true;
        };
        enableMediaToast = false;
        enableKeyboardLayoutToast = true;
        enableBatteryToast = true;
      };
      osd = {
        backgroundOpacity = 0.95;
      };
      audio = {
        visualizerType = "none";
      };
      colorSchemes = {
        useWallpaperColors = true;
        # darkMode = false;
        schedulingMode = "location";
        manualSunrise = "06:30";
        manualSunset = "18:30";
        generationMethod = "tonal-spot";
      };
      nightLight = {
        enabled = true;
        forced = false;
        autoSchedule = true;
        nightTemp = "1700";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };
    };
    /*
    colors = {
      # Google Light
      mError = "#b3261e";
      mOnError = "#fff";
      mOnPrimary = "#fff";
      mOnSecondary = "#fff";
      mOnSurface = "#1f1f1f";
      mOnSurfaceVariant = "#444746";
      mOnTertiary = "#fff";
      mOnHover = "#1f1f1f";
      mOutline = "#747775";
      mPrimary = "#0b57d0";
      mSecondary = "#00639b";
      mShadow = "#000000";
      mSurface = "#fff";
      mHover = "#e1e3e1";
      mSurfaceVariant = "#f0f4f9";
      mTertiary = "#146c2e";
      # Google Dark
      mError = "#f2b8b5";
      mOnError = "#601410";
      mOnPrimary = "#062e6f";
      mOnSecondary = "#035";
      mOnSurface = "#e3e3e3";
      mOnSurfaceVariant = "#c4c7c5";
      mOnTertiary = "#0a3818";
      mOnHover = "#e3e3e3";
      mOutline = "#8e918f";
      mPrimary = "#a8c7fa";
      mSecondary = "#7fcfff";
      mShadow = "#000000";
      mSurface = "#131314";
      mHover = "#37393b";
      mSurfaceVariant = "#1e1f20";
      mTertiary = "#6dd58c";
    };
    */
  };
}