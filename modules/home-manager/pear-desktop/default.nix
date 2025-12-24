{ pkgs, lib, config, ... }:
let 
  theme = ./theme.css;
  electronPreferences = ./preferences.json;
in
{
  home.packages = with pkgs; [
    # Renamed to pear-desktop in https://github.com/NixOS/nixpkgs/pull/473695
    youtube-music
  ];
  home.file."${config.xdg.configHome}/YouTube Music/Preferences" = {
    force = true;
    source = electronPreferences;
  };
  home.file."${config.xdg.configHome}/YouTube Music/config.json".text = builtins.toJSON {
    window-size = {
      width = 1100;
      height = 550;
    };
    window-maximized = true;
    window-position = {
      x = 0;
      y = 0;
    };
    url = "https://music.youtube.com";
    options = {
      tray = false;
      appVisible = true;
      autoUpdates = true;
      alwaysOnTop = false;
      hideMenu = false;
      hideMenuWarned = false;
      startAtLogin = false;
      disableHardwareAcceleration = false;
      removeUpgradeButton = true;
      restartOnConfigChanges = false;
      trayClickPlayPause = false;
      autoResetAppCache = false;
      resumeOnStart = false;
      likeButtons = "";
      proxy = "";
      startingPage = "Library";
      overrideUserAgent = false;
      usePodcastParticipantAsArtist = false;
      themes = [
        "${theme}"
      ];
    };
    plugins = {
      notifications = {};
      video-toggle = {
        mode = "custom";
        enabled = true;
        hideVideo = false;
        forceHide = false;
        align = "left";
      };
      precise-volume = {
        globalShortcuts = {};
      };
      discord = {
        listenAlong = true;
      };
      ambient-mode = {
        enabled = true;
      };
      sponsorblock = {
        enabled = true;
      };
      navigation = {
        enabled = false;
      };
    };
    __internal__ = {
      migrations = {
        version = "3.11.0";
      };
    };
  };
}
